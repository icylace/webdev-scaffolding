#!/usr/bin/env bash

# $@ = Optional integrations to use.
setup_vite() {
  local modules=()

  # Vite
  # Next Generation Frontend Tooling
  # https://vitejs.dev/
  modules+=('vite')

  # if [[ " $* " == *' eslint '* ]] ; then
  #   modules+=('')
  # fi

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/vite/vite.config.js" .

  # update_json '.scripts += {
  #   "check:types": "tsc --noEmit --incremental false",
  # }' ./package.json
}
