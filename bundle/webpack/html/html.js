"use strict"

const HtmlPlugin = require("html-webpack-plugin")

const htmlSetup = _ => ({
  plugins: [
    new HtmlPlugin({
      title: "WORK-IN-PROGRESS",
      template: "./src/client/index.ejs",
      inject: "body",
    }),
  ],
})

// const FaviconsPlugin = require("favicons-webpack-plugin")

// const faviconSetup = (settings, inProduction) => {
//   return inProduction
//     ? {
//         plugins: [
//           new FaviconsPlugin({
//             logo: "./src/client/assets/icons/logo-ipsum.png",
//             prefix: "icons/[hash]/",
//             background: "#000000",
//           }),
//         ],
//       }
//     : {}
// }

const SriPlugin = require("webpack-subresource-integrity")

const sriSetup = inProduction => {
  return inProduction ? { plugins: [new SriPlugin({ hashFuncNames: ["sha256", "sha384"] })] } : {}
}

// module.exports = [htmlSetup, faviconSetup, sriSetup]
module.exports = [htmlSetup, sriSetup]
