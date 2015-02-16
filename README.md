## Sensu-Plugins-ceph

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-ceph.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-ceph)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-ceph.svg)](http://badge.fury.io/rb/sensu-plugins-ceph)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-ceph/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-ceph)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-ceph/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-ceph)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-ceph.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-ceph)

## Functionality

## Files
 * bin/check-ceph
 * bin/metrics-ceph-osd
 
## Usage

## Installation

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-ceph -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-ceph`

#### Bundler

Add *sensu-plugins-disk-checks* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-ceph' do
  options('--prerelease')
  version '0.0.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-ceph' do
  options('--prerelease')
  version '0.0.1'
end
```

## Notes
