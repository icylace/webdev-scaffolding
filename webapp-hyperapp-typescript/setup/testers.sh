#!/usr/bin/env bash

setup_testers() {
  declare -n dev="$1"

  # # Cypress
  # # Fast, easy and reliable testing for anything that runs in a browser.
  # # https://www.cypress.io/
  # dev+=('cypress')

  # # faker.js
  # # generate massive amounts of fake data in Node.js and the browser
  # # https://github.com/marak/Faker.js/
  # dev+=('faker')

  # # Jest
  # # Delightful JavaScript Testing
  # # https://facebook.github.io/jest/
  # dev+=('jest')

  # # JSVerify
  # # JSVerify is a property-based testing library, highly inspired by QuickCheck.
  # # https://jsverify.github.io/
  # dev+=('jsverify')

  # TODO: Setup Stryker.
  # # Stryker
  # # Measure the effectiveness of JavaScript tests.
  # # https://stryker-mutator.io/
  # dev+=('stryker')
  # dev+=('stryker-api')
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
  # dev+=('supertest')
}
