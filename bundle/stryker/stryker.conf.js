"use strict"

// https://github.com/stryker-mutator/stryker/tree/master/packages/core#configuration

module.exports = config => {
  config.set({
    mutator: "javascript",
    packageManager: "yarn",
    reporters: ["clear-text", "progress"],
    testRunner: "jest",
    transpilers: [],
    coverageAnalysis: "off",
    // files: [],
    // mutator: "typescript",
    // transpilers: ["typescript", "webpack", "babel"],
    // reporter: ["html", "baseline", "clear-text", "progress", "dashboard"],
    // tsconfigFile: "tsconfig.json",
    // mutate: ["src/**/*.ts"],
    // webpack: {
    //   configFile: "webpack.config.js",
    // },
    // babelrcFile: ".babelrc",
  })
}
