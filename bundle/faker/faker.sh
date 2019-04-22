#!/usr/bin/env bash

setup_faker() {
  local modules=()

  # faker.js
  # generate massive amounts of fake data in the browser and node.js
  # https://github.com/marak/Faker.js
  modules+=('faker')

  yarn add --dev "${modules[@]}"
}
