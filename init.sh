#!/usr/bin/env bash

# # http://redsymbol.net/articles/unofficial-bash-strict-mode/
# set -euo pipefail
# IFS=$'\n\t'

#
# Checks if a command or program is available.
#
# Example usage:
#
# ```shell
# if we_have foo ; then
#   # foo exists
# else
#   # foo doesn't exist
# if
# ```
#
we_have() {
  return $(type "$@" > /dev/null 2>&1)
}

#
# Sets up a new web project.
#
# $1 = Code for project type.
# $2 = Name for project directory.
#
gimme() {
  local error='\e[1;31m'
  local reset='\e[0m'

  if ! we_have yarn ; then
    echo "${error}`yarn` is missing !${reset}"
    return 1
  fi

  if ! we_have jq ; then
    echo "${error}`jq` is missing !${reset}"
    return 1
  fi

  if [[ -z "$2" ]] ; then
    echo "${error}ERROR: You need to name your new project!${reset}"
    return 1
  fi

  # # https://stackoverflow.com/a/59916
  # local bundleDir="$(dirname $0)/bundle"

  local bundleDir="$HOME/My/Code/webdev-scaffolding/bundle"

  case "$1" in
    purs)
      scaffold_purescript "$bundleDir" "$2"
      ;;
    ts)
      scaffold_typescript "$bundleDir" "$2"
      ;;
    testpurs)
      scaffold_purescript_test "$bundleDir" "$2"
      ;;
    testwebpack)
      scaffold_webpack_test "$bundleDir" "$2"
      ;;
    *)
      echo "${error}ERROR: You need to use a proper scaffold code!${reset}"
      return 1
      ;;
  esac

  if [[ "$?" -ne 0 ]] ; then
    echo "${error}ERROR: Errors happened!${reset}"
    return 1
  fi

  echo "\n\n🔥  🎉  ✨  ········«  Project setup done ‼  »········ ✨  🎉  🔥"
}
