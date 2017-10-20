# Docker Shell-Test [![Docker Stars](https://img.shields.io/docker/stars/kamontat/shell-test.svg?style=flat-square)](https://store.docker.com/community/images/kamontat/shell-test) [![Docker Pulls](https://img.shields.io/docker/pulls/kamontat/shell-test.svg?style=flat-square)](https://store.docker.com/community/images/kamontat/shell-test)

- hub: https://hub.docker.com/r/kamontat/shell-test/
- store: https://store.docker.com/community/images/kamontat/shell-test

# Usage
In default this container config default execute command to `shellcheck` but you also able to change using other execute command by pass this option (`--entrypoint=""`) to you `docker run` command.
- Run using command: `docker run --rm -it -v <local-file>:<remote-file> kamontat/shell-test:<tag> <remote-file>`
    - `local-file` - you can move you file into inside of container
    - `remote-file` - name and locate it in container
    - `tag` - tag that you can find in this [link](https://hub.docker.com/r/kamontat/shell-test/tags/)
  - follow pattern `[bash|zsh]-([0-9.-]+)`

# Reference
1. [shellcheck](https://github.com/koalaman/shellcheck) - for lint check
2. [bash](https://hub.docker.com/_/bash/) - offical bash container
3. [alpine](http://alpinelinux.org/) - base lightweight linux OS
