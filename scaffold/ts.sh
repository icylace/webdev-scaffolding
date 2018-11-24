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

  # source "$1/babel/babel.sh"
  source "$1/base/base.sh"
  # source "$1/eslint/eslint.sh"
  # source "$1/git/git.sh"
  # source "$1/hyperapp/hyperapp.sh"
  # source "$1/markdown/markdown.sh"
  source "$1/node/node.sh"
  # source "$1/parcel/parcel.sh"
  # source "$1/postcss/postcss.sh"
  # source "$1/prettier/prettier.sh"
  # source "$1/stylelint/stylelint.sh"
  # source "$1/testers/testers.sh"
  # source "$1/tslint/tslint.sh"
  # source "$1/typescript/typescript.sh"

  mkdir "$2"
  cd "$2"
  mkdir ./src

  setup_base "$1"
  setup_node "$1"
  # setup_markdown "$1"
  # setup_babel "$1"
  # setup_eslint "$1"
  # setup_postcss "$1"
  # setup_stylelint "$1"
  # setup_hyperapp
  # setup_typescript 'jest'
  # setup_tslint "$1"
  # setup_prettier "$1" stylelint tslint
  # setup_parcel
  # setup_testers "$1"
  # setup_git "$1"
}
