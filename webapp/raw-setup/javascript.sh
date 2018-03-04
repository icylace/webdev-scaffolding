#!/usr/bin/env bash

#
# Sets up JavaScript functionality available to all projects.
#
setup_base_javascript_system() {
  local devFirstModules=()
  local devModules=()

  # uglify-es
  # A JavaScript parser, mangler/compressor and beautifier toolkit for ES6+.
  # https://github.com/mishoo/UglifyJS2/tree/harmony
  devModules+=('uglify-es')





  # ----------------------------------------------------------------------------

  yarn add --dev "${devFirstModules[@]}" "${devModules[@]}"

  # eslint --init
}
