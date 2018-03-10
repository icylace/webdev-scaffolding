"use strict"

// https://github.com/stryker-mutator/stryker/tree/master/packages/stryker#configuration

module.exports = function(config) {
  config.set({
    files: [],
    testRunner: "jest",
    mutator: "typescript",
    transpilers: ["typescript", "webpack", "babel"],
    reporter: ["html", "baseline", "clear-text", "progress", "dashboard"],
    coverageAnalysis: "off",
    tsconfigFile: "tsconfig.json",
    mutate: ["src/**/*.ts"],
    webpack: {
      configFile: "webpack.config.js",
    },
    babelrcFile: ".babelrc",
  })
}
