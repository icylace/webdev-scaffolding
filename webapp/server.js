"use strict"

const express = require("express")
const staticGzip = require("express-static-gzip")
const fs = require("fs")
const helmet = require("helmet")
const path = require("path")

const app = express()

app.use(helmet())

if (process.env.NODE_ENV === "production") {
  // console.log("PRODUCTION ENVIRONMENT")
  // app.use("/js", express.static(__dirname + "/public/js"))
  // // For Heroku.
  // pg.defaults.ssl = true
} else {
  console.log("DEVELOPMENT ENVIRONMENT: Turning on webpack middleware...")

  const devEnvStuff = "../.not-public/env"
  try {
    fs.statSync(devEnvStuff)
    require(devEnvStuff)
  } catch (err) {
    console.log(`Note: '${devEnvStuff}' not found.`)
  }

  // Hot reloading is only meant for development.
  require("./dev").useWebpack(app)
}

// Serve pre-compressed assets.
app.use(staticGzip(path.join(__dirname, "dist"), { enableBrotli: true }))

// Our single-page client application will handle all non-API routes
// including invalid ones.
app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "dist", "index.html"))
})

const port = parseInt(process.env.PORT, 10) || 8080
app.listen(port, () => {
  console.log(`Listening on port ${port}`)
})
