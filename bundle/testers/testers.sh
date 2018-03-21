#!/usr/bin/env bash

setup_testers() {
  local devModules=()

  # # Cypress
  # # Fast, easy and reliable testing for anything that runs in a browser.
  # # https://www.cypress.io/
  # devModules+=('cypress')

  # # faker.js
  # # generate massive amounts of fake data in Node.js and the browser
  # # https://github.com/marak/Faker.js/
  # devModules+=('faker')

  # Jest
  # Delightful JavaScript Testing
  # https://facebook.github.io/jest/
  devModules+=('jest')

  # # JSVerify
  # # JSVerify is a property-based testing library, highly inspired by QuickCheck.
  # # https://jsverify.github.io/
  # devModules+=('jsverify')

  # TODO: Setup Stryker.
  # # Stryker
  # # Measure the effectiveness of JavaScript tests.
  # # https://stryker-mutator.io/
  # devModules+=('stryker')
  # devModules+=('stryker-api')
  # "stryker-babel-transpiler": "^0.3.1",
  # "stryker-baseline-reporter": "^1.0.3",
  # "stryker-html-reporter": "^0.12.1",
  # "stryker-jest-runner": "^0.5.1",
  # "stryker-typescript": "^0.9.1",
  # "stryker-webpack-transpiler": "^0.1.4",

  # TODO: See if this is the best way to test HTTP stuff.
  # # SuperTest
  # # Super-agent driven library for testing node.js HTTP servers using
  # # a fluent API
  # # https://github.com/visionmedia/supertest
  # devModules+=('supertest')

  yarn add --dev "${devModules[@]}"

  # ----------------------------------------------------------------------------

  local here="$(dirname $0)/../bundle/testers"

  cp "$here/jest.config.js" .
  # cp "$here/stryker.conf.js" .

  # ----------------------------------------------------------------------------

  local tmp="$(mktemp)"
  # jq '.scripts += {
  #   test: "jest",
  #   "test:coverage": "jest --coverage",
  #   "test:mutation": "stryker run"
  # }' ./package.json > "$tmp" && mv "$tmp" ./package.json
  jq '.scripts += {
    test: "jest",
    "test:coverage": "jest --coverage"
  }' ./package.json > "$tmp" && mv "$tmp" ./package.json
}
