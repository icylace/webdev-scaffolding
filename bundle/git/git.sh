#!/usr/bin/env bash

# Updates (or creates if necessary) .gitignore.
#
# $1 = The predefined external gitignore definition to get.
#
save_gitignore() {
  if [ -z "$1" ] ; then
    echo 'ERROR: Which language/platform/etc. to get the .gitignore definition for?'
    return 1
  fi

  local tmp="$(mktemp)"

  if [ -f ./.gitignore ] ; then
    cat ./.gitignore >> "$tmp"
  fi

  curl --location "https://www.gitignore.io/api/$1" >> "$tmp"

  mv "$tmp" ./.gitignore
}

# Parameters:
# $1 - Which extra gitignores to get.
#
setup_git() {
  if ! we_have git ; then
    echo 'ERROR: `git` is missing !'
    return 1
  fi

  if [ -z "$1" ] ; then
    echo 'ERROR: Scaffold bundle directory required.'
    return 1
  fi

  # TODO: do we wanna use Commitizen stuff ?

  # # Commitizen
  # # Simple commit conventions for internet citizens.
  # # https://commitizen.github.io/cz-cli/
  # yarn add --dev commitizen

  # # commitlint
  # # Lint commit messages
  # # https://marionebl.github.io/commitlint/#/
  # yarn add --dev @commitlint/cli

  # # @commitlint/prompt
  # # This is the library and commitizen adapter version of commitlint prompt.
  # # https://www.npmjs.com/package/@commitlint/prompt
  # yarn add --dev @commitlint/prompt

  # ----------------------------------------------------------------------------

  cp "$1/git/.gitattributes" .
  # cp "$1/git/commitlint.config.js" .

  # mkdir -v './.githooks'
  # cp "$1/commit-msg" ./.githooks

  # ----------------------------------------------------------------------------

  local tmp="$(mktemp)"

  # https://stackoverflow.com/a/4990185
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

  curl --location "https://www.gitignore.io/api/git" >> "$tmp"

  # ----------------------------------------------------------------------------

  # TODO: work on this

  # curl --location "https://www.gitignore.io/api/visualstudiocode" >> "$tmp"

  cat <<EOF >> "$tmp"
# ------------------------------------------------------------------------------
#  https://github.com/github/gitignore/blob/master/Global/VisualStudioCode.gitignore
#  https://github.com/github/gitignore/pull/2618
# ------------------------------------------------------------------------------

.vscode
.vscode/*
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json
EOF

  # ----------------------------------------------------------------------------

  mv "$tmp" ./.gitignore

  # ----------------------------------------------------------------------------

  git init
  # git config core.hooksPath .githooks
  git add --all
  git commit --message='set: Scaffold a new project.'
}
