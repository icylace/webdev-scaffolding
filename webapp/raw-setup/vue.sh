#!/usr/bin/env bash

setup_vue() {
  local devFirstModules=()
  local devModules=()
  local modules=()

  # Vue
  # Single-page application framework.
  # https://vuejs.org/
  modules+=('vue')

  # vue-class-component
  # ES / TypeScript decorator for class-style Vue components.
  # https://github.com/vuejs/vue-class-component
  devModules+=('vue-class-component')

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

  # vue-typescript-import-dts
  # TypeScript declaration file that allows using 'import' with *.vue files
  # https://github.com/locoslab/vue-typescript-import-dts
  devModules+=('vue-typescript-import-dts')

  # # Vuelidate
  # # Model-based validation for Vue.js 2.
  # # https://monterail.github.io/vuelidate/
  # modules+=('vuelidate')

  # Vuex
  # Centralized State Management for Vue.js.
  # https://vuex.vuejs.org/en/
  modules+=('vuex')

  # ----------------------------------------------------------------------------

  # Element
  # A Vue.js 2.0 UI Toolkit for Web
  # http://element.eleme.io/
  modules+=('element-ui')

  # # babel-plugin-component
  # # Modular antd build plugin for babel.
  # # https://github.com/qingwei-li/babel-plugin-component
  # devModules+=('babel-plugin-component')

  # ----------------------------------------------------------------------------






  modules+=('buefy')
  devModules+=('vue-server-renderer')



vue-typescript-import-dts
faker
vue-property-decorator
material-design-icons




  # ----------------------------------------------------------------------------

  yarn add --dev "${devFirstModules[@]}" "${devModules[@]}"
  yarn add "${modules[@]}"
}
