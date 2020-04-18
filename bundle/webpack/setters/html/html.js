"use strict"

const HtmlPlugin = require("html-webpack-plugin")
const SriPlugin = require("webpack-subresource-integrity")

module.exports = inProduction => {
  const setup = {
    plugins: [
      new HtmlPlugin({
        title: "WORK-IN-PROGRESS",
        template: "./src/index.ejs",
        inject: "body",
      }),
    ],
  }

  if (inProduction) {
    setup.plugins.push(new SriPlugin({ hashFuncNames: ["sha256", "sha384"] }))
  }

  return setup
}

// TODO: replace this:
// const FaviconsPlugin = require("favicons-webpack-plugin")
// const faviconSetup = (settings, inProduction) => {
//   return inProduction
//     ? {
//         plugins: [
//           new FaviconsPlugin({
//             logo: "./src/assets/icons/logo-ipsum.png",
//             prefix: "icons/[hash]/",
//             background: "#000000",
//           }),
//         ],
//       }
//     : {}
// }
