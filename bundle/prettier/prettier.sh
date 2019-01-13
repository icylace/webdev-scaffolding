#!/usr/bin/env bash

# $@ = Optional integrations to use.
setup_prettier() {
  local modules=()

  # Prettier
  # Prettier is an opinionated code formatter.
  # https://prettier.io/
  # https://prettier.io/docs/en/install.html
  yarn add --dev --exact prettier

  if [[ $@ == *'stylelint'* ]] ; then
    # stylelint-config-prettier
    # Turns off all rules that are unnecessary or might conflict with prettier.
    # https://github.com/shannonmoeller/stylelint-config-prettier
    modules+=('stylelint-config-prettier')
  fi

  if [[ $@ == *'tslint'* ]] ; then
    # tslint-config-prettier
    # Use tslint with prettier without any conflict
    # https://github.com/alexjoverm/tslint-config-prettier
    modules+=('tslint-config-prettier')
  fi

  yarn add --dev "${modules[@]}"

  cp "$WEBDEV_BUNDLE/prettier/.prettierignore" .
  cp "$WEBDEV_BUNDLE/prettier/prettier.config.js" .
}
