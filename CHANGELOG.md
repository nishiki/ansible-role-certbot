# CHANGELOG

This project adheres to [Semantic Versioning](http://semver.org/).
Which is based on [Keep A Changelog](http://keepachangelog.com/)

## [Unreleased]

### Added

- test: add check yamllint
- test: add support debian 11

### Changed

- test: replace kitchen to molecule
- chore: use FQCN for module name

### Removed

- test: remove support debian 9

## [2.1.1] 2018-11-26
- fix: replace shell module to command
- test: add check ansible-lint with galaxy rules

## [2.1.0] 2018-11-25
- BREAKING CHANGE: minimal ansible version is 2.5 now
- fix: replace inline module to cron for renew cron
- test: use new docker images
- test: add tavis-ci to run tests

## [2.0.0] 2018-07-07
- feat: add renew hook script

## [1.0.0] 2018-06-10
- first version
