#!/usr/bin/env bash

#
# Sets up CSS and JavaScript functionality available to app projects.
#
setup_app_system() {
  local devFirstModules=()
  local devModules=()
  local modules=()

  # icylace-object-utils
  # A collection of object-related utilities.
  # https://github.com/icylace/icylace-object-utils
  modules+=('icylace-object-utils')

  # lodash.isequal
  # The Lodash method `_.isEqual` exported as a Node.js module.
  # https://www.npmjs.com/package/lodash.isequal
  modules+=('lodash.isequal')

  # ----------------------------------------------------------------------------
  #  Back-end
  # ----------------------------------------------------------------------------

  # Express
  # Web server framework.
  # http://expressjs.com/
  modules+=('express')

  # express-static-gzip
  # A wrapper for `express.static` that allows serving pre-gzipped files.
  # https://github.com/tkoenig89/express-static-gzip
  modules+=('express-static-gzip')

  # Helmet
  # Security with HTTP header for Express.
  # https://helmetjs.github.io/
  modules+=('helmet')

  # # pm2
  # # A process manager for Node.js
  # # http://pm2.keymetrics.io/
  # devModules+=('pm2')

  # ----------------------------------------------------------------------------
  #  Front-end
  # ----------------------------------------------------------------------------

  # # date-fns
  # # Date and time funciton library.
  # # https://date-fns.org/
  # modules+=('date-fns')

  # # Lost Grid
  # # Grid layout system.
  # # http://lostgrid.org/
  # devModules+=('lost')

  # # Ramda
  # # Functional programming library
  # # http://ramdajs.com/
  # modules+=('ramda')

  # ----------------------------------------------------------------------------



  devModules+=('vue-server-renderer')

vue-typescript-import-dts
faker
vue-property-decorator
material-design-icons









  # ----------------------------------------------------------------------------
  #  Testing
  # ----------------------------------------------------------------------------

  # SuperTest
  # HTTP assertions.
  # https://github.com/visionmedia/supertest
  devModules+=('supertest')

  # ----------------------------------------------------------------------------

  yarn add --dev "${devFirstModules[@]}" "${devModules[@]}"
  yarn add "${modules[@]}"
}
