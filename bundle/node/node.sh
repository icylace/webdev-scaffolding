#!/usr/bin/env bash

# $@ = Optional integrations to use.
setup_node() {
  cp "$WEBDEV_BUNDLE/node/.nvmrc" .
  cp "$WEBDEV_BUNDLE/node/package.json" .

  if we_have save_gitignore ; then
    save_gitignore node
  fi
}
