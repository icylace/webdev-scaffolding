#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
# $2 = Name of project.
scaffold_typescript() {
  local error='\e[1;31m'
  local reset='\e[0m'

  if [[ -z "$1" ]] ; then
    echo "${error}ERROR: Scaffold bundle directory required!${reset}"
    return 1
  fi

  if [[ -z "$2" ]] ; then
    echo "${error}ERROR: You need to name your new project!${reset}"
    return 1
  fi

  mkdir "$2"
  cd "$2"
  mkdir ./src

  # source "$1/git/git.sh"
  # setup_git "$1/git"

  source "$1/base/base.sh"
  setup_base "$1/base"

  source "$1/node/node.sh"
  setup_node "$1/node"

  # source "$1/markdown/markdown.sh"
  # setup_markdown "$1/markdown"

  # source "$1/babel/babel.sh"
  # setup_babel "$1/babel"

  # source "$1/eslint/eslint.sh"
  # setup_eslint "$1/eslint"

  # source "$1/postcss/postcss.sh"
  # setup_postcss "$1/postcss"

  # source "$1/stylelint/stylelint.sh"
  # setup_stylelint "$1/stylelint"

  # source "$1/hyperapp/hyperapp.sh"
  # setup_hyperapp "$1/hyperapp"

  # source "$1/typescript/typescript.sh"
  # setup_typescript "$1/typescript" jest

  # source "$1/tslint/tslint.sh"
  # setup_tslint "$1/tslint"

  # source "$1/prettier/prettier.sh"
  # setup_prettier "$1/prettier" stylelint tslint

  # source "$1/parcel/parcel.sh"
  # setup_parcel "$1/parcel"

  # source "$1/testers/testers.sh"
  # setup_testers "$1/testers"
}
