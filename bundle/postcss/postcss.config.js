// https://github.com/postcss/postcss#usage

const settings = {
  modules: true,
  plugins: {
    "postcss-import": {},
    "postcss-cssnext": { browsers: "last 2 versions" },
    "postcss-reporter": { clearReportedMessages: true },
  },
}

module.exports = settings
