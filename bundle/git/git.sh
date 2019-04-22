#!/usr/bin/env bash

# Updates (or creates if necessary) .gitignore.
#
# $1 = The predefined external gitignore definition to get.
#
save_gitignore() {
  if [[ -z "$1" ]] ; then
    echo 'ERROR: Which language/platform/etc. to get the .gitignore definition for?'
    return 1
  fi

  local tmp="$(mktemp)"

  if [ -f ./.gitignore ] ; then
    cat ./.gitignore >> "$tmp"
  fi

  curl --location "https://www.gitignore.io/api/$1" >> "$tmp"

  mv -f "$tmp" ./.gitignore
}

# ------------------------------------------------------------------------------

setup_git() {
  if ! we_have git ; then
    echo 'ERROR: `git` is missing !'
    return 1
  fi

  cp "$WEBDEV_BUNDLE/git/.gitattributes" .

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

  mv -f "$tmp" ./.gitignore

  git init
  # git add --all
  # git commit --message='set: Scaffold a new project.'
}
