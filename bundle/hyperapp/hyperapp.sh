#!/usr/bin/env bash

setup_hyperapp() {
  local prodModules=()
  local modules=()

  # Hyperapp
  # 1 KB JavaScript library for building frontend applications
  # https://hyperapp.js.org/
  prodModules+=('hyperapp')

  # Hyperapp FX
  # Effects as data for Hyperapp.
  # https://github.com/hyperapp/fx
  prodModules+=('@hyperapp/fx')

  # @hyperapp/html
  # Html helper functions for Hyperapp.
  # https://github.com/hyperapp/html
  prodModules+=('@hyperapp/html')

  # @hyperapp/router
  # Declarative routing for Hyperapp using the History API.
  # https://github.com/hyperapp/router
  prodModules+=('@hyperapp/router')

  # @hyperapp/logger
  # Log Hyperapp state updates and action information to the console.
  # https://github.com/hyperapp/logger
  modules+=('@hyperapp/logger')

  # Hyperapp Test
  # Helping test your Hyperapp apps.
  # https://github.com/okwolf/hyperapp-test
  modules+=('hyperapp-test')

  yarn add "${prodModules[@]}"
  yarn add --dev "${modules[@]}"
}
