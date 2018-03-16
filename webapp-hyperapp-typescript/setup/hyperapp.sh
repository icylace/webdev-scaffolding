#!/usr/bin/env bash

setup_hyperapp() {
  declare -n dev="$1"
  declare -n main="$2"

  # Hyperapp
  # 1 KB JavaScript library for building frontend applications
  # https://hyperapp.js.org/
  main+=('hyperapp')

  # Hyperapp FX
  # Effects as data for Hyperapp.
  # https://github.com/hyperapp/fx
  main+=('@hyperapp/fx')

  # @hyperapp/html
  # Html helper functions for Hyperapp.
  # https://github.com/hyperapp/html
  main+=('@hyperapp/html')

  # @hyperapp/logger
  # Log Hyperapp state updates and action information to the console.
  # https://github.com/hyperapp/logger
  dev+=('@hyperapp/logger')

  # @hyperapp/router
  # Declarative routing for Hyperapp using the History API.
  # https://github.com/hyperapp/router
  main+=('@hyperapp/router')

  # Hyperapp Test
  # Helping test your Hyperapp apps.
  # https://github.com/okwolf/hyperapp-test
  dev+=('hyperapp-test')
}
