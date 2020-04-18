#!/usr/bin/env bash

setup_jest() {
  local modules=()

  # Jest
  # Jest is a delightful JavaScript Testing Framework with a focus on simplicity.
  # https://jestjs.io/
  # https://www.npmjs.com/package/jest
  modules+=('jest')

  if [[ " $* " == *' typescript '* ]] ; then
    # @types/jest
    # This package contains type definitions for Jest (http://facebook.github.io/jest/).
    # https://github.com/DefinitelyTyped/DefinitelyTyped/tree/master/types/jest
    # https://www.npmjs.com/package/@types/jest
    modules+=('@types/jest')

    # ts-jest
    # TypeScript preprocessor with sourcemap support for Jest
    # https://kulshekhar.github.io/ts-jest/
    # https://www.npmjs.com/package/ts-jest
    modules+=('ts-jest')
  fi

  npm install --save-dev "${modules[@]}"

  # ----------------------------------------------------------------------------

  cp "$WEBDEV_BUNDLE/jest/jest.config.js" .

  update_json '.scripts += {
    test: "jest",
    "test:coverage": "jest --coverage"
  }' ./package.json
}
