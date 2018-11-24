#!/usr/bin/env bash

setup_hyperapp() {
  # Hyperapp
  # 1 KB JavaScript library for building frontend applications
  # https://hyperapp.js.org/
  yarn add hyperapp

  # Hyperapp FX
  # Effects as data for Hyperapp.
  # https://github.com/hyperapp/fx
  yarn add @hyperapp/fx

  # @hyperapp/html
  # Html helper functions for Hyperapp.
  # https://github.com/hyperapp/html
  yarn add @hyperapp/html

  # @hyperapp/router
  # Declarative routing for Hyperapp using the History API.
  # https://github.com/hyperapp/router
  yarn add @hyperapp/router

  # @hyperapp/logger
  # Log Hyperapp state updates and action information to the console.
  # https://github.com/hyperapp/logger
  yarn add --dev @hyperapp/logger

  # Hyperapp Test
  # Helping test your Hyperapp apps.
  # https://github.com/okwolf/hyperapp-test
  yarn add --dev hyperapp-test
}
