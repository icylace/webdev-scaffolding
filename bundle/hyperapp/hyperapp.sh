#!/usr/bin/env bash

setup_hyperapp() {
  local devModules=()
  local modules=()

  # Hyperapp
  # 1 KB JavaScript library for building frontend applications
  # https://hyperapp.js.org/
  modules+=('hyperapp')

  # Hyperapp FX
  # Effects as data for Hyperapp.
  # https://github.com/hyperapp/fx
  modules+=('@hyperapp/fx')

  # @hyperapp/html
  # Html helper functions for Hyperapp.
  # https://github.com/hyperapp/html
  modules+=('@hyperapp/html')

  # @hyperapp/logger
  # Log Hyperapp state updates and action information to the console.
  # https://github.com/hyperapp/logger
  devModules+=('@hyperapp/logger')

  # @hyperapp/router
  # Declarative routing for Hyperapp using the History API.
  # https://github.com/hyperapp/router
  modules+=('@hyperapp/router')

  # Hyperapp Test
  # Helping test your Hyperapp apps.
  # https://github.com/okwolf/hyperapp-test
  devModules+=('hyperapp-test')

  yarn add --dev "${devModules[@]}"
  yarn add "${modules[@]}"
}
