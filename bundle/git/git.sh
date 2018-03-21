#!/usr/bin/env bash

# Parameters:
# $1 - Which extra gitignores to get.
#
setup_git() {
  local devModules=()

  # Commitizen
  # Simple commit conventions for internet citizens.
  # https://commitizen.github.io/cz-cli/
  devModules+=('commitizen')

  # commitlint
  # Lint commit messages
  # https://marionebl.github.io/commitlint/#/
  devModules+=('@commitlint/cli')

  # @commitlint/prompt
  # This is the library and commitizen adapter version of commitlint prompt.
  # https://www.npmjs.com/package/@commitlint/prompt
  devModules+=('@commitlint/prompt')

  yarn add --dev "${devModules[@]}"

  # ----------------------------------------------------------------------------

  local here="$(dirname $0)/../bundle/git"

  cp "$here/.gitattributes" .
  cp "$here/commitlint.config.js" .

  mkdir -v './.githooks'
  cp "$here/commit-msg" ./.githooks

  # ----------------------------------------------------------------------------

  local tmp="$(mktemp)"

  # http://stackoverflow.com/a/4990185/1935675
  cat <<EOF > "$tmp"
# https://git-scm.com/docs/gitignore

EOF

  if [ -f ./.gitignore ] ; then
    cat ./.gitignore >> "$tmp"
  fi

  cat <<EOF >> "$tmp"

# Generated output.
dist
EOF

  curl --location "https://www.gitignore.io/api/Node${1:+,$1}" >> "$tmp"

  mv "$tmp" ./.gitignore

  # ----------------------------------------------------------------------------

  git init
  git config core.hooksPath .githooks
  git add --all
  git commit --message='build: Scaffold a new project.'
}
