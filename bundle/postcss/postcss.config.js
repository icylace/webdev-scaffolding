// https://github.com/postcss/postcss#usage

module.exports = {
  modules: true,
  plugins: {
    "postcss-import": {},
    "postcss-cssnext": { browsers: "last 2 versions" },
    "postcss-reporter": { clearReportedMessages: true },
  },
}
