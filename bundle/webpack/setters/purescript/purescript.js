"use strict"

module.exports = (_inProduction, watching) => ({
  resolve: {
    extensions: [".purs"],
  },
  module: {
    rules: [
      {
        test: /\.purs?$/,
        loader: "purs-loader",
        exclude: /node_modules/,
        options: {
          psc: "psa",
          output: "dist",
          bundleOutput: "tmp/purescriptOutput.js",
          src: ["src/**/*.purs"],
          watch: watching,
        },
      },
    ],
  },
})

// test: /\.purs$/,
//         use: [
//           {
//             loader: 'purs-loader',
//             options: {
//               src: [
//                 'bower_components/purescript-*/src/**/*.purs',
//                 'src/**/*.purs'
//               ],
//               bundle: false,
//               psc: 'psa',
//               watch: isWebpackDevServer || isWatch,
//               pscIde: false
//             }
//           }
//         ]
