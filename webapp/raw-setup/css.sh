#!/usr/bin/env bash

#
# Sets up CSS functionality available to all projects.
#
setup_base_css_system() {
  local devModules=()

  # # CSS Stats
  # # Gathers statistics on CSS usage.
  # # http://cssstats.com/
  # devModules+=('cssstats')

  # ----------------------------------------------------------------------------
  #  Transpilation
  # ----------------------------------------------------------------------------



  # ----------------------------------------------------------------------------
  #  Linting
  # ----------------------------------------------------------------------------


  # ----------------------------------------------------------------------------

  yarn add --dev "${devModules[@]}"
}
