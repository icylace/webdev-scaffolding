#!/usr/bin/env bash

# $1 = Directory for the Node.js bundle.
setup_node() {
  cp "$1/.nvmrc" .
  cp "$1/package.json" .

  if we_have save_gitignore ; then
    save_gitignore node
  fi
}
