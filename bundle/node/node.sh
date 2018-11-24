#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_node() {
  if [ -z "$1" ] ; then
    echo 'ERROR: Scaffold bundle directory required.'
    return 1
  fi

  cp "$1/node/.nvmrc" .
  cp "$1/node/package.json" .

  save_gitignore node
}
