#!/usr/bin/env bash

setup_node() {
  local here="$(dirname $0)/../bundle/node"

  cp "$here/.nvmrc" .
  cp "$here/package.json" .
}
