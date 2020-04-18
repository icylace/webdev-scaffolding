"use strict"

// https://github.com/stryker-mutator/stryker/tree/master/packages/core#configuration

// TODO:

module.exports = {
  // coverageAnalysis: 'off',
  coverageAnalysis: 'perTest',
  mutator: "javascript",
  // mutator: "typescript",
  reporters: ["clear-text", "progress"],
  testFramework: 'jest',
  testRunner: "jest",
  // transpilers: [],
}

// module.exports = config => {
//   config.set({
//     mutator: "javascript",
//     packageManager: "npm",
//     // packageManager: "yarn",
//     reporters: ["clear-text", "progress"],
//     testRunner: "jest",
//     coverageAnalysis: "off",
//     // files: [],
//     // mutator: "typescript",
//     // transpilers: ["typescript", "webpack", "babel"],
//     // reporter: ["html", "baseline", "clear-text", "progress", "dashboard"],
//     // tsconfigFile: "tsconfig.json",
//     // mutate: ["src/**/*.ts"],
//     // webpack: {
//     //   configFile: "webpack.config.js",
//     // },
//     // babelrcFile: ".babelrc",
//   })
// }
