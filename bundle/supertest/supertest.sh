#!/usr/bin/env bash

setup_supertest() {
  local modules=()

  # SuperTest
  # 🕷Super-agent driven library for testing node.js HTTP servers using a
  # fluent API.
  # https://github.com/visionmedia/supertest
  modules+=('supertest')

  yarn add --dev "${modules[@]}"
}
