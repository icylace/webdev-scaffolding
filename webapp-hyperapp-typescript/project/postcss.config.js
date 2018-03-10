"use strict"

// https://github.com/postcss/postcss#usage

module.exports = {
  plugins: [
    require("postcss-import")(),
    require("postcss-cssnext")({ browsers: "last 2 versions" }),
    // require("postcss-colorblind")({ method: "achromatopsia" }),
    require("postcss-reporter")({ clearReportedMessages: true }),
  ],
}
