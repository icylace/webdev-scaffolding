#!/usr/bin/env bash

# # http://redsymbol.net/articles/unofficial-bash-strict-mode/
# set -euo pipefail
# IFS=$'\n\t'

WEBDEV_SCAFFOLD="$WEBDEV_SCAFFOLDING/scaffold"

source "$WEBDEV_SCAFFOLD/purescript.sh"
source "$WEBDEV_SCAFFOLD/typescript.sh"
source "$WEBDEV_SCAFFOLD/vanilla.sh"
source "$WEBDEV_SCAFFOLD/test/base.sh"
source "$WEBDEV_SCAFFOLD/test/css.sh"
source "$WEBDEV_SCAFFOLD/test/git.sh"
source "$WEBDEV_SCAFFOLD/test/js.sh"
source "$WEBDEV_SCAFFOLD/test/node.sh"
source "$WEBDEV_SCAFFOLD/test/purescript.sh"
source "$WEBDEV_SCAFFOLD/test/typescript.sh"
source "$WEBDEV_SCAFFOLD/test/webpack.sh"

WEBDEV_BUNDLE="$WEBDEV_SCAFFOLDING/bundle"

source "$WEBDEV_BUNDLE/babel/babel.sh"
source "$WEBDEV_BUNDLE/base/base.sh"
source "$WEBDEV_BUNDLE/commitlint/commitlint.sh"
source "$WEBDEV_BUNDLE/cypress/cypress.sh"
source "$WEBDEV_BUNDLE/eslint/eslint.sh"
source "$WEBDEV_BUNDLE/faker/faker.sh"
source "$WEBDEV_BUNDLE/git/git.sh"
source "$WEBDEV_BUNDLE/hyperapp/hyperapp.sh"
source "$WEBDEV_BUNDLE/jest/jest.sh"
source "$WEBDEV_BUNDLE/jsverify/jsverify.sh"
source "$WEBDEV_BUNDLE/markdown/markdown.sh"
source "$WEBDEV_BUNDLE/node/node.sh"
source "$WEBDEV_BUNDLE/parcel/parcel.sh"
source "$WEBDEV_BUNDLE/postcss/postcss.sh"
source "$WEBDEV_BUNDLE/prettier/prettier.sh"
source "$WEBDEV_BUNDLE/purescript/purescript.sh"
source "$WEBDEV_BUNDLE/stryker/stryker.sh"
source "$WEBDEV_BUNDLE/stylelint/stylelint.sh"
source "$WEBDEV_BUNDLE/supertest/supertest.sh"
source "$WEBDEV_BUNDLE/tslint/tslint.sh"
source "$WEBDEV_BUNDLE/typescript/typescript.sh"
source "$WEBDEV_BUNDLE/webpack/webpack.sh"

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

  local scaffolds=(
    hyperapp_basic
    purescript
    typescript
    test_base
    test_css
    test_git
    test_js
    test_node
    test_purescript
    test_typescript
    test_webpack
  )

  if [[ " ${scaffolds[@]} " != *" $1 "* ]] ; then
    echo "${error}ERROR: You need to use a proper scaffold code!${reset}"
    return 1
  fi

  mkdir "$2"
  cd "$2"
  # mkdir ./src

  "scaffold_$1"

  if [[ "$?" -ne 0 ]] ; then
    echo "${error}ERROR: Errors happened!${reset}"
    return 1
  fi

  echo "\n\n🔥  🎉  ✨  ········«  Project setup done ‼  »········ ✨  🎉  🔥"
}
