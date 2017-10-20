# Docker [![Docker Pulls](https://img.shields.io/docker/pulls/kamontat/zsh.svg?style=flat-square)](https://store.docker.com/community/images/kamontat/zsh)
- hub: https://hub.docker.com/r/kamontat/zsh/
- store: https://store.docker.com/community/images/kamontat/zsh

# Usage
run using command: `docker run --rm -it -v <local-file>:<remote-file> kamontat/zsh <execute-command>`
- `local-file` - you can move you file into inside of container
- `remote-file` - name and locate it in container
- `execute-command` - command that what to execute in container (mostly using remote-file as executor)

# Configuration
1. this will auto deploy to docker if git tag are created.
2. the master branch will deploy as latest version in docker hub
