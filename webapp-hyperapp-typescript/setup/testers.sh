#!/usr/bin/env bash

setup_testers() {
  declare -n dev="$1"

  # faker.js
  # generate massive amounts of fake data in Node.js and the browser
  # https://github.com/marak/Faker.js/
  dev+=('faker')

  # Jest
  # Delightful JavaScript Testing
  # https://facebook.github.io/jest/
  dev+=('jest')

  # JSVerify
  # JSVerify is a property-based testing library, highly inspired by QuickCheck.
  # https://jsverify.github.io/
  dev+=('jsverify')

  # Stryker
  # Measure the effectiveness of JavaScript tests.
  # https://stryker-mutator.github.io/
  dev+=('stryker')
  dev+=('stryker-api')

  # SuperTest
  # Super-agent driven library for testing node.js HTTP servers using
  # a fluent API
  # https://github.com/visionmedia/supertest
  dev+=('supertest')
}
