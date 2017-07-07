#!/usr/bin/env bash

# http://www.ostricher.com/2014/10/the-right-way-to-get-the-directory-of-a-bash-script/
source "$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)/webdev-base.sh"


#
# Sets up CSS and JavaScript functionality available to app projects.
#
setup_app_system() {
  local devFirstModules=()
  local devModules=()
  local modules=()

  # ----------------------------------------------------------------------------
  #  Back-end
  # ----------------------------------------------------------------------------

  # # compression
  # # Middleware for dynamically compressing files with gzip.
  # # https://www.npmjs.com/package/compression
  # devModules+=('compression')

  # Express
  # Web server framework.
  # http://expressjs.com/
  modules+=('express')

  # express-static-gzip
  # A wrapper for `express.static` that allows serving pre-gzipped files.
  # https://www.npmjs.com/package/express-static-gzip
  modules+=('express-static-gzip')

  # Helmet
  # Security with HTTP header for Express.
  # https://helmetjs.github.io/
  modules+=('helmet')

  # pm2
  # A process manager for Node.js
  # http://pm2.keymetrics.io/
  devModules+=('pm2')

  # ----------------------------------------------------------------------------
  #  Front-end
  # ----------------------------------------------------------------------------

  # # date-fns
  # # Date and time funciton library.
  # # https://date-fns.org/
  # modules+=('date-fns')

  # Lost Grid
  # Grid layout system.
  # http://lostgrid.org/
  devModules+=('lost')

  # Ramda
  # Functional programming library
  # http://ramdajs.com/
  modules+=('ramda')

  # ----------------------------------------------------------------------------
  #  Front-end framework - Vue
  # ----------------------------------------------------------------------------

  # Vue
  # Single-page application framework.
  # https://vuejs.org/
  modules+=('vue')

  # vue-loader
  # A webpack loader that transforms Vue components into plain
  # JavaScript modules.
  # https://vue-loader.vuejs.org/en/
  devModules+=('vue-loader')

  # vue-router
  # The official router for Vue.js.
  # https://router.vuejs.org/en/
  modules+=('vue-router')

  # vue-template-compiler
  # Pre-compiles Vue 2.0 templates into render functions to avoid
  # runtime-compilation overhead and CSP restrictions.
  # https://www.npmjs.com/package/vue-template-compiler
  devFirstModules+=('vue-template-compiler')

  # # Vuelidate
  # # Model-based validation for Vue.js 2.
  # # https://monterail.github.io/vuelidate/
  # modules+=('vuelidate')

  # ----------------------------------------------------------------------------
  #  Testing
  # ----------------------------------------------------------------------------

  # SuperTest
  # HTTP assertions.
  # https://www.npmjs.com/package/supertest
  devModules+=('supertest')

  # ----------------------------------------------------------------------------

  yarn add --dev "${devFirstModules[@]}" "${devModules[@]}"
  yarn add "${modules[@]}"

  # flow init
  # eslint --init
}


#
# Sets up a web app project.
#
setup_app_project() {
  setup_base_css_system
  setup_base_javascript_system
  setup_build_system
  setup_app_system
}


setup_app_project
