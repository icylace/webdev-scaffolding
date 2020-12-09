// import resolve from "@rollup/plugin-node-resolve"

export default ctx => ({
  input: "./output/typescript/index.js",
  output: [
    {
      file: "./output/rollup/index.js",
      format: "esm",
    },
    // ctx.env === "prod" ? {
    //   file: "./output/rollup/index.umd.js",
    //   format: "umd",
    //   name: "TODO:",
    // } : null,
  ],
  plugins: [
    // resolve(),
  ],
})
