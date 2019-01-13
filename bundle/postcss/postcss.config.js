// https://github.com/postcss/postcss#usage

const settings = {
  modules: true,
  plugins: [
    require("postcss-import"),
    require("postcss-preset-env")({
      stage: 2,
      features: { "nesting-rules": true },
    }),
    require("postcss-reporter")({ clearReportedMessages: true }),
  ],
}

module.exports = settings
