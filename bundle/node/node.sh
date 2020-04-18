#!/usr/bin/env bash

# $@ = Optional integrations to use.
setup_node() {
  # Node.js
  # Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine.
  # https://nodejs.org/

  if we_have save_gitignore ; then
    save_gitignore node
  fi

  cp "$WEBDEV_BUNDLE/node/.nvmrc" .
  cp "$WEBDEV_BUNDLE/node/package.json" .
}
