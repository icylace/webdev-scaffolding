"use strict"

const include = (setters) =>
  setters[0]
    .split("\n")
    .filter((setter) => setter)
    .map((setter) => require(`./setters/${setter}.js`))
