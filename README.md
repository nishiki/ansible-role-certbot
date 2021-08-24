# Ansible role: Certbot

[![Version](https://img.shields.io/badge/latest_version-2.1.1-green.svg)](https://git.yaegashi.fr/nishiki/ansible-role-certbot/releases)
[![Build Status](https://travis-ci.org/nishiki/ansible-role-certbot.svg?branch=master)](https://travis-ci.org/nishiki/ansible-role-certbot)
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://git.yaegashi.fr/nishiki/ansible-role-certbot/src/branch/master/LICENSE)

Generate certificate SSL with certbot.

## Requirements

* Ansible >= 2.9
* Debian
  * Buster
  * Bullseye

## Role variables

- `certbot_mail` - mail address used by let's encrypt to notify
- `certbot_key_size` - private key size (default: `4096`)
- `certbot_path` - path where certbot write temporary files(default: `/var/www/acme`)
- `certbot_domains` - array with the domain name and command
- `certbot_role` - string must be master or slave, if master generate the certificates

## How to use

```
- hosts: git-server
  roles:
    - certbot
```

## Development

### Test with molecule and docker

* install [docker](https://docs.docker.com/engine/installation/)
* install `python3` and `python3-pip`
* install molecule and dependencies `pip3 install molecule molecule-docker docker ansible-lint pytest-testinfra yamllint`
* run `molecule test`


## License

```
Copyright (c) 2018 Adrien Waksberg

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
