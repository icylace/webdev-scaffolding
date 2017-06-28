// @flow
"use strict"

const express           = require("express")
const expressStaticGzip = require("express-static-gzip")
const helmet            = require("helmet")
const path              = require("path")

const app = express()

app.use(helmet())

if (process.env.NODE_ENV === "production") {
  // console.log("PRODUCTION ENVIRONMENT")

  // app.use("/js", express.static(__dirname + "/public/js"))

  // // For Heroku.
  // pg.defaults.ssl = true
} else {
  console.log("DEVELOPMENT ENVIRONMENT: Turning on webpack middleware...")

  // require("../.not-public/env")

  const dev = require("./dev.js")

  // Hot reloading is only meant for use during development.
  dev.useWebpack(app)
}

// // Make Webpack bundles available to the client.
// app.use(express.static(path.join(__dirname, "public")))

// Make Webpack bundles available to the client.
app.use(expressStaticGzip(path.join(__dirname, "public")))

// Our single-page client application will handle all non-API routes
// including invalid ones.
app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "views", "index.html"))
})

const port = parseInt(process.env.PORT, 10) || 8080
app.listen(port, () => {
  console.log(`Listening on port ${port}`)
})
