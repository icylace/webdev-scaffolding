#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_base() {
  if [ -z "$1" ] ; then
    echo 'ERROR: Scaffold bundle directory required.'
    return 1
  fi

  mkdir ./dist
  mkdir -p ./src/client

  cp "$1/base/.editorconfig" .
  cp "$1/base/README.md" .
  cp "$1/base/humans.txt" ./src/client

  # Put the current year in the license file.
  sed "s/{{year}}/$(date +%Y)/g" "$1/LICENSE.md" > ./LICENSE.md
}
