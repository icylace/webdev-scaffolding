#!/usr/bin/env bash

# # http://redsymbol.net/articles/unofficial-bash-strict-mode/
# set -euo pipefail
# IFS=$'\n\t'

WEBDEV_SCAFFOLD="$WEBDEV_SCAFFOLDING/scaffold"

source "$WEBDEV_SCAFFOLD/purescript.sh"
source "$WEBDEV_SCAFFOLD/typescript.sh"
source "$WEBDEV_SCAFFOLD/test/base.sh"
source "$WEBDEV_SCAFFOLD/test/css.sh"
source "$WEBDEV_SCAFFOLD/test/js.sh"
source "$WEBDEV_SCAFFOLD/test/purescript.sh"
source "$WEBDEV_SCAFFOLD/test/webpack.sh"

WEBDEV_BUNDLE="$WEBDEV_SCAFFOLDING/bundle"

source "$WEBDEV_BUNDLE/babel/babel.sh"
source "$WEBDEV_BUNDLE/base/base.sh"
source "$WEBDEV_BUNDLE/commitlint/commitlint.sh"
source "$WEBDEV_BUNDLE/eslint/eslint.sh"
source "$WEBDEV_BUNDLE/git/git.sh"
source "$WEBDEV_BUNDLE/hyperapp/hyperapp.sh"
source "$WEBDEV_BUNDLE/markdown/markdown.sh"
source "$WEBDEV_BUNDLE/node/node.sh"
source "$WEBDEV_BUNDLE/parcel/parcel.sh"
source "$WEBDEV_BUNDLE/postcss/postcss.sh"
source "$WEBDEV_BUNDLE/prettier/prettier.sh"
source "$WEBDEV_BUNDLE/purescript/purescript.sh"
source "$WEBDEV_BUNDLE/stylelint/stylelint.sh"
source "$WEBDEV_BUNDLE/testers/testers.sh"
source "$WEBDEV_BUNDLE/tslint/tslint.sh"
source "$WEBDEV_BUNDLE/typescript/typescript.sh"
source "$WEBDEV_BUNDLE/webpack/webpack.sh"

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

  if ! we_have jq ; then
    echo "${error}`jq` (https://stedolan.github.io/jq/) is missing !${reset}"
    return 1
  fi

  if ! we_have yarn ; then
    echo "${error}`yarn` (https://yarnpkg.com/en/) is missing !${reset}"
    return 1
  fi

  if [[ -z "$2" ]] ; then
    echo "${error}ERROR: You need to name your new project!${reset}"
    return 1
  fi

  # # https://stackoverflow.com/a/59916
  # local bundleDir="$(dirname $0)/bundle"

  local scaffolds=(
    purescript
    typescript
    test_base
    test_css
    test_js
    test_purscript
    test_webpack
  )

  if [[ " ${scaffolds[@]} " != *" $1 "* ]] ; then
    echo "${error}ERROR: You need to use a proper scaffold code!${reset}"
    return 1
  fi

  mkdir "$2"
  cd "$2"
  mkdir ./src

  "scaffold_$1"

  if [[ "$?" -ne 0 ]] ; then
    echo "${error}ERROR: Errors happened!${reset}"
    return 1
  fi

  echo "\n\n🔥  🎉  ✨  ········«  Project setup done ‼  »········ ✨  🎉  🔥"
}
