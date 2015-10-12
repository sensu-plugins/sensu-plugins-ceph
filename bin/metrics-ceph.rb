#! /usr/bin/env ruby
#
# metrics-ceph
#
# DESCRIPTION:
#   Overall ceph throughput
#
# OUTPUT:
#   metric data
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#   gem: english
#   ceph client
#
# USAGE:
#   #YELLOW
#
# NOTES:
#   Runs 'ceph status' command to output cluster status and metrics,
#   May need read access to ceph keyring and/or root access for
#   authentication.
#
# LICENSE:
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/metric/cli'
require 'json'
require 'timeout'
require 'English'
require 'socket'

class CephMetrics < Sensu::Plugin::Metric::CLI::Graphite
  option :keyring,
         description: 'Path to cephx authentication keyring file',
         short: '-k KEY',
         long: '--keyring',
         proc: proc { |k| " -k #{k}" }

  option :monitor,
         description: 'Optional monitor IP',
         short: '-m MON',
         long: '--monitor',
         proc: proc { |m| " -m #{m}" }

  option :cluster,
         description: 'Optional cluster name',
         short: '-c NAME',
         long: '--cluster',
         proc: proc { |c| " --cluster=#{c}" }

  option :timeout,
         description: 'Timeout (default 10)',
         short: '-t SEC',
         long: '--timeout',
         proc: proc(&:to_i),
         default: 10

  option :prefix,
         description: 'Metric prefix',
         short: '-p PREFIX',
         long: '--prefix',
         default: "#{Socket.gethostname}.ceph"

  def run_cmd(cmd)
    pipe, status = nil
    begin
      cmd += config[:cluster] if config[:cluster]
      cmd += config[:keyring] if config[:keyring]
      cmd += config[:monitor] if config[:monitor]
      cmd += ' 2>&1'
      Timeout.timeout(config[:timeout]) do
        pipe = IO.popen(cmd)
        Process.wait(pipe.pid)
        status = $CHILD_STATUS.exitstatus
      end
    rescue Timeout::Error
      begin
        Process.kill(9, pipe.pid)
        Process.wait(pipe.pid)
      rescue Errno::ESRCH, Errno::EPERM
        # Catch errors from trying to kill the timed-out process
        # We must do something here to stop travis complaining
        critical 'Execution timed out'
      ensure
        critical 'Execution timed out'
      end
    end
    output = pipe.read
    critical "Command '#{cmd}' returned no output" if output.to_s == ''
    critical output unless status == 0
    output
  end

  def run
    result = run_cmd('ceph status --format=json')
    data = JSON.parse(result)
    ignore_keys = %w(pgs_by_state version)
    data['pgmap'].each do |key, val|
      puts "#{config[:prefix]}.#{key} #{val}\n" unless ignore_keys.include? key
    end
    ok
  end
end
