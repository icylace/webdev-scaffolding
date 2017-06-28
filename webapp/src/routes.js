// @flow
"use strict"

import Home from "./components/routes/Home.vue"

export const routes = [
  { path: "/", component: Home },
  { path: "*", redirect: "/" },
]
