#!/usr/bin/env bash

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.


# -------------------------------------------------
# Description:  generate Dockerfile with specify version
# Create by:    Kamontat Chantrachirathumrong
# Since:        19/10/2560
# -------------------------------------------------
# Version:      1      -- complete
# -------------------------------------------------
# Error code    1      -- first parameter not found
#               2      -- unknown script name
#               5      -- directory not found (*)
# -------------------------------------------------

HELP="
# what this do
update dockerfile to specify version abd script
support 1 backup before replace out

# requirement
params - 1 - either bash or zsh
         2 - script version
         3 - shellcheck version (optional)
"

# docker cli is required
# command -v docker &>/dev/null ||\
  # exit 1

[ -z "$1" ] &&\
  exit 1

[[ "$1" =~ "help" ]] &&\
  echo "$HELP" &&\
  exit 0

[[ "$1" != "bash" ]] && [[ "$1" != "zsh" ]] &&\
  exit 2

SHELL_CHECK_VERSION="0.4.6"

# @params - 1 - script name (bash|zsh)
#           2 - version
#           3 - shellcheck version
generate_code() {
  echo "
FROM $1:$2

# shellcheck version $3
COPY shellcheck-$3/shellcheck /usr/local/bin/shellcheck

# RUN bash --version

ENTRYPOINT [\"/usr/local/bin/shellcheck\"]
  "
}

# backup Dockerfile if exist
[ -d "$1" ] || exit 5
[ -f "$1/Dockerfile" ] && mv "$1/Dockerfile" "$1/Dockerfile.bp"

# check optional parameter 3 - this a shellcheck version
[ -n "$3" ] && SHELL_CHECK_VERSION="$3"

sh="$1"
[[ "$sh" == "zsh" ]] && sh="kamontat/$sh"

generate_code "$sh" "$2" "$SHELL_CHECK_VERSION" > "$1/Dockerfile"

