#!/usr/bin/env bash

setup_commitlint() {
  if ! we_have git ; then
    echo 'ERROR: `git` is missing !'
    return 1
  fi

  local modules=()

  # TODO: do we wanna use Commitizen stuff ?

  # Commitizen
  # Simple commit conventions for internet citizens.
  # https://commitizen.github.io/cz-cli/
  modules+=('commitizen')

  # commitlint
  # Lint commit messages
  # https://marionebl.github.io/commitlint/#/
  modules+=('@commitlint/cli')

  # @commitlint/prompt
  # This is the library and commitizen adapter version of commitlint prompt.
  # https://www.npmjs.com/package/@commitlint/prompt
  modules+=('@commitlint/prompt')

  yarn add --dev "${modules[@]}"

  cp "$WEBDEV_BUNDLE/commitlint/commitlint.config.js" .

  mkdir ./.githooks
  cp "$WEBDEV_BUNDLE/commitlint/commit-msg" ./.githooks

  git config core.hooksPath .githooks
}
