#!/usr/bin/env bash

# # http://redsymbol.net/articles/unofficial-bash-strict-mode/
# set -euo pipefail
# IFS=$'\n\t'

WEBDEV_BUNDLE="$WEBDEV_SCAFFOLDING/bundle"

update_json() {
  local filter="$1"
  local file="$2"
  local tmp="$(mktemp)"

  if [ ! -f "$file" ] ; then
    echo '{}' > "$file"
  fi

  jq "$filter" "$file" > "$tmp" && mv -f "$tmp" "$file"
}

# $1 = directory
gather_bundles() {
  for filepath in "$1/"* ; do
    if [ -d "$filepath" ] ; then
      source "$filepath/"*.sh
    fi
  done
}

setup_bundles() {
  # When we call each setup function we make sure it's aware of other bundles
  # being used so it can take special care with relevant integrations.
  for i in "$@" ; do
    "setup_$i" "$@"
  done
}

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

# $1 = directory
# $2 = prefix
scaffold_files() {
  local prefix="$2"
  local names=()

  for filepath in "$1/"* ; do
    local name="${filepath//$1\/}"
    local unslash="${name//\//_}"
    local undash="${unslash//-/_}"
    local baseName="${undash/\.sh/}"
    local pureName="${prefix:+${prefix}_}$baseName"
    if [ -f "$filepath" ] ; then
      names+=("$pureName")
    elif [ -d "$filepath" ] ; then
      names+=("$(scaffold_files "$filepath" "$pureName")")
    fi
  done

  echo "$names"
}

#
# Sets up a new web project.
#
# $1 = Code for project type.
# $2 = Name for project directory.
#
gimme() {
  local boldBlack='\e[1;30m'
  local boldRed='\e[1;31m'
  local boldMagenta='\e[1;35m'
  local boldCyan='\e[1;36m'
  local reset='\e[0m'
  local error="${boldRed}"

  if ! we_have jq ; then
    echo "${error}`jq` (https://stedolan.github.io/jq/) is missing !${reset}"
    return 1
  fi

  if ! we_have yarn ; then
    echo "${error}`yarn` (https://yarnpkg.com/en/) is missing !${reset}"
    return 1
  fi

  if [[ -z "$2" ]] ; then
    echo "format: ${boldMagenta}gimme ${boldBlack}[${boldCyan}scaffold-name${boldBlack}] [${boldCyan}project-name${boldBlack}]${reset}"
    return 1
  fi

  # # https://stackoverflow.com/a/59916
  # local bundleDir="$(dirname $0)/bundle"

  local scaffolds=$(scaffold_files "$WEBDEV_SCAFFOLDING/scaffold")

  scaffolds+=('test_babel')
  scaffolds+=('test_base')
  scaffolds+=('test_css')
  scaffolds+=('test_git')
  scaffolds+=('test_hyperapp')
  scaffolds+=('test_js')
  scaffolds+=('test_node')
  scaffolds+=('test_purescript')
  scaffolds+=('test_static_site')
  scaffolds+=('test_typescript')
  scaffolds+=('test_webpack')
  scaffolds+=('test_webpack_purescript')
  scaffolds+=('test_webpack_typescript')

  if [[ " ${scaffolds[@]} " != *" $1 "* ]] ; then
    echo "${error}ERROR: You need to use a proper scaffold code!${reset}"
    return 1
  fi

  mkdir "$2"
  cd "$2"

  "scaffold_$1"

  if [[ "$?" -ne 0 ]] ; then
    echo "${error}ERROR: Errors happened!${reset}"
    return 1
  fi

  echo "\n\n🔥  🎉  ✨  ········«  Project setup done ‼  »········ ✨  🎉  🔥"
}

# ------------------------------------------------------------------------------

gather_bundles "$WEBDEV_SCAFFOLDING/bundle"

source "$WEBDEV_SCAFFOLDING/scaffold/"*.sh
source "$WEBDEV_SCAFFOLDING/test/scaffold.sh"
