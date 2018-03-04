#!/usr/bin/env bash



#
# Sets up the build system available to all projects.
#
setup_base_build() {
  local devFirstModules=()
  local devModules=()








  # cross-env
  # Sets environment variables in a cross-platform way.
  # https://github.com/kentcdodds/cross-env
  devModules+=('cross-env')

  # ----------------------------------------------------------------------------
  #  Task running and bundling
  # ----------------------------------------------------------------------------





  # fuse-box







  # ----------------------------------------------------------------------------

  yarn add --dev "${devFirstModules[@]}" "${devModules[@]}"
}
