#!/usr/bin/env bash

setup_prettier() {
  local modules=()

  # Prettier
  # Prettier is an opinionated code formatter.
  # https://prettier.io/
  # https://www.npmjs.com/package/prettier
  modules+=('prettier')
  # NOTE: Installingan exact version is recommended:
  # https://prettier.io/docs/en/install.html
  # npm install --save-dev --save-exact prettier

  if [[ " $* " == *' eslint '* ]] ; then
    # eslint-config-prettier
    # Turns off all rules that are unnecessary or might conflict with Prettier.
    # https://github.com/prettier/eslint-config-prettier
    # https://www.npmjs.com/package/eslint-config-prettier
    modules+=('eslint-config-prettier')

    # eslint-plugin-prettier
    # ESLint plugin for Prettier formatting
    # https://github.com/prettier/eslint-plugin-prettier
    # https://www.npmjs.com/package/eslint-plugin-prettier
    modules+=('eslint-plugin-prettier')
  fi

  if [[ " $* " == *' tslint '* ]] ; then
    # tslint-config-prettier
    # Use tslint with prettier without any conflict
    # https://github.com/prettier/tslint-config-prettier
    # https://www.npmjs.com/package/tslint-config-prettier
    modules+=('tslint-config-prettier')

    update_json '.scripts += {
      "check:tslint": "tslint-config-prettier-check ./tslint.json"
    }' ./package.json
  fi

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/prettier/.prettierignore" .
  cp "$WEBDEV_BUNDLE/prettier/prettier.config.js" .
}
