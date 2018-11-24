#!/usr/bin/env bash

# Parameters:
# $1 = Directory containing scaffold bundles.
# $2+ = Optional prettier integrations to use.
#
setup_prettier() {
  if [ -z "$1" ] ; then
    echo 'ERROR: Scaffold bundle directory required.'
    return 1
  fi

  cp "$1/prettier/.prettierignore" .
  cp "$1/prettier/prettier.config.js" .

  shift

  # ----------------------------------------------------------------------------

  # Prettier
  # Prettier is an opinionated code formatter.
  # https://prettier.io/
  yarn add --dev --exact prettier

  if [[ " $* " == *"stylelint"* ]] ; then
    # stylelint-config-prettier
    # Turns off all rules that are unnecessary or might conflict with prettier.
    # https://github.com/shannonmoeller/stylelint-config-prettier
    yarn add --dev stylelint-config-prettier
  fi

  if [[ " $* " == *"tslint"* ]] ; then
    # tslint-config-prettier
    # Use tslint with prettier without any conflict
    # https://github.com/alexjoverm/tslint-config-prettier
    yarn add --dev tslint-config-prettier
  fi
}
