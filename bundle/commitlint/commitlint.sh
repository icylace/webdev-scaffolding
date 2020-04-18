#!/usr/bin/env bash

setup_commitlint() {
  if ! we_have git ; then
    echo 'ERROR: `git` is missing !'
    return 1
  fi

  local modules=()

  # TODO: do we wanna use Commitizen stuff ?
  #
  # Commitizen
  # Simple commit conventions for internet citizens.
  # https://commitizen.github.io/cz-cli/
  # https://www.npmjs.com/package/commitizen
  modules+=('commitizen')

  # commitlint
  # Lint commit messages
  # https://commitlint.js.org/
  # https://www.npmjs.com/package/@commitlint/cli
  modules+=('@commitlint/cli')

  # @commitlint/prompt
  # This is the library and commitizen adapter version of commitlint prompt.
  # https://github.com/conventional-changelog/commitlint
  # https://www.npmjs.com/package/@commitlint/prompt
  modules+=('@commitlint/prompt')

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/commitlint/commitlint.config.js" .
  mkdir ./.githooks
  cp "$WEBDEV_BUNDLE/commitlint/commit-msg" ./.githooks

  git config core.hooksPath .githooks
}
