# Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed at [Keep A Changelog](http://keepachangelog.com/)

## [Unreleased]

## [1.0.2] - 2019-06-11
### Fixed
- metrics-ceph-osd.rb: fixed invalid call to JSON.parse by using the scope resultion operators (@CoRfr)

## [1.0.1] - 2017-08-09
### Fixed
- check-ceph.rb: fixed a bug where the ignore flag was not working due to order of operations (@jklare)

### Added
- slack badge (@majormoses)
- standard .github templates (@majormoses)

## [1.0.0] - 2017-05-17
### Changed
- Upgrade to Rubocop 0.40 and cleanup

### Fixed
- metrics-ceph.rb: Prevent stderr from polluting JSON output (@CoRfr)

### Added
- Ruby 2.3 and 2.4 support (@eheydrick)

### Removed
- Ruby 1.9.3 support

## [0.0.5] - 2015-11-26
### Added
- include client name option when interacting with ceph
- metrics script
### Fixes
- use upstram output
- default prefix includes hostname

## [0.0.4] - 2015-07-31
### Changed
- updated documentation links
- updated rubocop to `0.32.1`
- put all deps in alpha order
- removed unused tasks

### Fixed
- health check only runs once on failure with details
- removes processing and conditional over health check result when unnecessary

## [0.0.3] - 2015-07-14

### Changed
- updated sensu-plugin gem to 1.2.0

## 0.0.2 - 2015-06-02

### Fixed
- added binstubs

### Changed
- removed cruft from /lib

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-ceph/compare/1.0.2...HEAD
[1.0.2]: https://github.com/sensu-plugins/sensu-plugins-ceph/compare/1.0.1...1.0.2
[1.0.1]: https://github.com/sensu-plugins/sensu-plugins-ceph/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-ceph/compare/0.0.5...1.0.0
[0.0.5]: https://github.com/sensu-plugins/sensu-plugins-ceph/compare/0.0.4...0.0.5
[0.0.4]: https://github.com/sensu-plugins/sensu-plugins-ceph/compare/0.0.3...0.0.4
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-ceph/compare/0.0.2...0.0.3
