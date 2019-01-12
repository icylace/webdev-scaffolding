"use strict"

// https://github.com/remarkjs/remark-lint/blob/master/doc/rules.md

const settings = {
  plugins: [
    "remark-preset-lint-consistent",
    "remark-preset-lint-recommended",
    "remark-preset-lint-markdown-style-guide",

    // // https://github.github.com/gfm/#example-272
    // [
    //   "remark-lint-checkbox-character-style",
    //   ["error", { checked: "x", unchecked: " " }]
    // ]

    "remark-lint-checkbox-content-indent",
    // ["remark-lint-emphasis-marker", ["error", "_"]],
    ["remark-lint-first-heading-level", ["error", 1]],
    ["remark-lint-linebreak-style", ["error", "unix"]],
    "remark-lint-no-duplicate-headings-in-section",
    "remark-lint-no-empty-url",
    "remark-lint-no-heading-indent",
    "remark-lint-no-heading-like-paragraph",
    "remark-lint-no-html",
    "remark-lint-no-missing-blank-lines",
    "remark-lint-no-paragraph-content-indent",
    "remark-lint-no-reference-like-url",
    "remark-lint-no-tabs",
    // ["remark-lint-ordered-list-marker-value", ["error", "single"]],

    // https://github.com/vhf/remark-lint-alphabetize-lists
    "remark-lint-alphabetize-lists",

    // // https://github.com/RichardLitt/remark-lint-appropriate-heading
    // "remark-lint-appropriate-heading",

    // https://github.com/vhf/remark-lint-blank-lines-1-0-2
    "remark-lint-blank-lines-1-0-2",

    // https://github.com/vhf/remark-lint-books-links
    "remark-lint-books-links",

    // https://github.com/Qard/remark-lint-code
    "remark-lint-code",

    // https://github.com/davidtheclark/remark-lint-no-dead-urls
    "remark-lint-no-dead-urls",

    // https://github.com/zerok/remark-lint-emoji-limit
    ["remark-lint-emoji-limit", ["warn", { max: 5 }]],

    // https://github.com/vhf/remark-lint-no-empty-sections
    "remark-lint-no-empty-sections",

    // https://github.com/zerok/remark-lint-heading-length
    ["remark-lint-heading-length", ["error", { min: 1, max: 10 }]],

    // https://github.com/vhf/remark-lint-heading-whitespace
    "remark-lint-heading-whitespace",

    // https://github.com/wemake-services/remark-lint-are-links-valid/tree/master/packages/duplicate
    "remark-lint-are-links-valid-duplicate",

    // https://github.com/wemake-services/remark-lint-are-links-valid/tree/master/packages/alive
    "remark-lint-are-links-valid-alive",

    // // https://github.com/vhf/remark-lint-no-url-trailing-slash
    // "remark-lint-no-url-trailing-slash",

    // // https://github.com/zerok/remark-lint-write-good
    // ["remark-lint-write-good", ["warn", { passive: false }]],

    // // https://github.com/remarkjs/remark-validate-links
    // "remark-validate-links",
  ],
}

module.exports = settings
