#!/usr/bin/env bash

setup_hyperapp() {
  local prodModules=()

  # Hyperapp
  # 1 KB JavaScript library for building frontend applications
  # https://hyperapp.js.org/
  prodModules+=('hyperapp')

  # # Hyperapp FX
  # # Effects as data for Hyperapp.
  # # https://github.com/hyperapp/fx
  # prodModules+=('@hyperapp/fx')

  # # @hyperapp/router
  # # Declarative routing for Hyperapp using the History API.
  # # https://github.com/hyperapp/router
  # prodModules+=('@hyperapp/router')

  yarn add "${prodModules[@]}"
}
