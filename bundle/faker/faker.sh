#!/usr/bin/env bash

setup_faker() {
  local modules=()

  # faker.js
  # generate massive amounts of fake data in the browser and node.js
  # https://github.com/marak/Faker.js
  # http://marak.github.io/faker.js/
  # https://www.npmjs.com/package/faker
  modules+=('faker')

  npm install --save-dev "${modules[@]}"
}
