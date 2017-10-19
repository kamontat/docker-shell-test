#!/usr/bin/env bash

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.


# -------------------------------------------------
# Description:  deploy code to docker cloud
# Create by:    Kamontat Chantrachirathumrong
# Since:        19/10/2560
# -------------------------------------------------
# Version:      1      -- complete
# -------------------------------------------------
# Error code    1      -- docker not found
#               2      -- first parameter not found
#               3      -- unknown script name
#               5      -- directory not found (*)
# -------------------------------------------------

HELP="
# what this do
1. build new image
2. add tag to that image
3. push the tag to cloud docker

# requirement
params - 1 - either bash or zsh
         2 - script version
"

# docker cli is required
command -v docker &>/dev/null ||\
  exit 1

[ -z "$1" ] &&\
  exit 2

[[ "$1" =~ "help" ]] &&\
  echo "$HELP" &&\
  exit 0

[[ "$1" != "bash" ]] && [[ "$1" != "zsh" ]] &&\
  exit 3


# $1 - bash | zsh
# $2 - version

USERNAME="kamontat"
IMAGE_NAME="shell-test"

TAG_NAME="$1-$2"

FULLY_IMAGE_NAME="$IMAGE_NAME:$TAG_NAME"
FULLY_REMOTE_IMAGE_NAME="$USERNAME/$IMAGE_NAME:$TAG_NAME"

cd "$1" || exit 5

docker build -t "$FULLY_IMAGE_NAME" .
docker tag "$FULLY_IMAGE_NAME" "$FULLY_REMOTE_IMAGE_NAME"
docker push "$FULLY_REMOTE_IMAGE_NAME"

