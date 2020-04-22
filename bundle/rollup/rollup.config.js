// import includePaths from "rollup-plugin-includepaths"
// import resolve from "@rollup/plugin-node-resolve"

export default {
  input: "./output/typescript/index.js",
  output: [
    {
      file: "./output/rollup/index.js",
      format: "esm",
    },
    {
      file: "./output/rollup/index.umd.js",
      format: "umd",
      name: "TODO:",
    },
  ],
  plugins: [
    // includePaths({
    //   include: {},
    //   paths: ['src/lib', 'src/other'],
    //   external: [],
    //   extensions: ['.js', '.json', '.html']
    // }),
    // resolve(),
  ],
}
