#!/usr/bin/env bash

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.


# -------------------------------------------------
# Description:  utils script combine together
# Create by:    Kamontat Chantrachirathumrong
# Since:        19/10/2560
# -------------------------------------------------
# Version:      0.0.1  -- description
# -------------------------------------------------
# Error code    1      -- error
# -------------------------------------------------

[ -z "$1" ] && exit 1

[[ "$1" == "build" ]] && shift && ./generate-code.sh "$@" && exit 0 || exit $?
[[ "$1" == "deploy" ]] && shift && ./deploy.sh "$@" && exit 0 || exit $?
[[ "$1" == "all" ]] && shift && ./generate-code.sh "$@" && ./deploy.sh "$@" && exit 0 || exit $?


echo "
Helper script

Parameter:
1. First
  1. build  - run generate code script
  2. deploy - run deploy code script
  3. all    - run both together
N. Next n parameter will pass to those script, Please learn the script work clearly
"
exit 1
