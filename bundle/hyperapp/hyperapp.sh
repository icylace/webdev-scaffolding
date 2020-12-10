#!/usr/bin/env bash

setup_hyperapp() {
  local prodModules=()

  # Hyperapp
  # The tiny framework for building web interfaces.
  # https://hyperapp.dev/
  # https://www.npmjs.com/package/hyperapp
  prodModules+=('hyperapp')

  # # Hyperapp FX
  # # Effects for use with Hyperapp
  # # https://github.com/okwolf/hyperapp-fx
  # # https://www.npmjs.com/package/hyperapp-fx
  # prodModules+=('hyperapp-fx@next')

  # # TODO:
  # prodModules+=('eyepiece')
  # prodModules+=('hyperapplicable')
  # prodModules+=('uy')

  npm install --dev "${prodModules[@]}"
}
