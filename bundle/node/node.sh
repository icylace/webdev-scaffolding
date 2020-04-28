#!/usr/bin/env bash

# $@ = Optional integrations to use.
setup_node() {
  # Node.js
  # Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine.
  # https://nodejs.org/

  if we_have save_gitignore ; then
    save_gitignore node
  fi

  # https://github.com/nvm-sh/nvm#nvmrc
  cp "$WEBDEV_BUNDLE/node/.nvmrc" .

  # https://docs.npmjs.com/files/package.json
  # https://docs.npmjs.com/misc/scripts
  # https://docs.npmjs.com/misc/config#config-settings
  # https://areknawo.com/whats-what-package-json-cheatsheet/
  cp "$WEBDEV_BUNDLE/node/package.json" .
}
