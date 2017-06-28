// @flow
"use strict"

const inProduction = (process.env.NODE_ENV === "production")

module.exports = {
  plugins: [
    require("postcss-import")(),
    require("lost")(),
    require("postcss-cssnext")({ browsers: "last 2 versions" }),
    (!inProduction ? require("cssstats")() : null),
    (!inProduction ? require("postcss-stats-reporter")() : null),
    require("postcss-reporter")({ clearReportedMessages: true }),
  ],
}
