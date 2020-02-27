#!/usr/bin/env bash

setup_hyperapp() {
  local prodModules=()

  # Hyperapp
  # The tiny framework for building web interfaces.
  # https://hyperapp.dev/
  prodModules+=('hyperapp')

  # Hyperapp FX
  # Effects for use with Hyperapp
  # https://github.com/okwolf/hyperapp-fx
  prodModules+=('hyperapp-fx@next')

  yarn add "${prodModules[@]}"
}
