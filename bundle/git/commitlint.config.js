"use strict"

// https://marionebl.github.io/commitlint/#/reference-rules

const settings = {
  rules: {
    "body-leading-blank": [2, "always"],
    "body-max-length": [2, "always", 512],
    "body-min-length": [2, "always", 0],
    "footer-leading-blank": [2, "always"],
    "footer-max-length": [2, "always", 512],
    "footer-min-length": [2, "always", 0],
    "header-max-length": [2, "always", 512],
    "header-min-length": [2, "always", 0],
    "references-empty": [0, "never"],
    "scope-enum": [0, "always", []],
    "scope-case": [2, "always", "lowerCase"],
    "scope-empty": [2, "always"],
    "scope-max-length": [2, "always", 32],
    "scope-min-length": [2, "always", 0],
    "subject-case": [2, "always", "sentence-case"],
    "subject-empty": [2, "never"],
    "subject-full-stop": [0],
    "subject-max-length": [2, "always", 80],
    "subject-min-length": [2, "always", 3],
    "type-enum": [
      2,
      "always",
      [
        "hotfix",
        "breaking",
        "security",
        "perf",
        "design",
        "fix",
        "build",
        "test",
        "feature",
        "removal",
        "refactor",
        "docs",
        "nit",
        "multiple",
      ],
    ],
    "type-case": [2, "always", "lower-case"],
    "type-empty": [2, "never"],
    "type-max-length": [2, "always", 8],
    "type-min-length": [2, "always", 3],
    "signed-off-by": [0, "always", "Signed-off by:"],
  },
}

module.exports = settings
