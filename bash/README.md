# Docker command
1. build 
    - `docker build -t shell-test:<bash|zsh>-<x.x.x> -f <x.x>/Dockerfile .`
2. run 
    - `docker run --rm -it -v <abs-path-sh-file>:/<remote-file> shell-test:<bash|zsh>-<x.x.x> <remote-file>`
