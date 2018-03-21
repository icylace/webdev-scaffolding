#!/usr/bin/env bash

setup_base() {
  mkdir ./dist
  mkdir -p ./src/client

  local here="$(dirname $0)/../bundle/base"

  cp "$here/.editorconfig" .
  cp "$here/README.md" .
  cp "$here/humans.txt" ./src/client

  sed "s/{{year}}/$(date +%Y)/g" "$here/LICENSE.md" > ./LICENSE.md
}
