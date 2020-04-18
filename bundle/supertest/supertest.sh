#!/usr/bin/env bash

setup_supertest() {
  local modules=()

  # SuperTest
  # 🕷Super-agent driven library for testing node.js HTTP servers using a
  # fluent API.
  # https://github.com/visionmedia/supertest
  # https://www.npmjs.com/package/supertest
  modules+=('supertest')

  npm install --save-dev "${modules[@]}"
}
