#!/usr/bin/env bash

setup_markdown() {
  local devModules=()

  # remark-lint
  # Markdown code style linter
  # https://github.com/remarkjs/remark-lint
  devModules+=('remark-lint')

  # remark-cli
  # Command-line interface for remark.
  # https://github.com/remarkjs/remark/tree/master/packages/remark-cli
  devModules+=('remark-cli')

  # remark-preset-lint-consistent
  # remark preset to configure remark-lint with settings that
  # enforce consistency.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-preset-lint-consistent
  devModules+=('remark-preset-lint-consistent')

  # remark-preset-lint-recommended
  # emark preset to configure remark-lint with settings that prevent mistakes
  # or syntaxes that do not work correctly across vendors.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-preset-lint-recommended
  devModules+=('remark-preset-lint-recommended')

  # remark-preset-lint-markdown-style-guide
  # remark preset to configure remark-lint with settings that
  # the Markdown Style Guide.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-preset-lint-markdown-style-guide
  devModules+=('remark-preset-lint-markdown-style-guide')

  # remark-lint-checkbox-content-indent
  # Warn when list item checkboxes are followed by too much white-space.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-lint-checkbox-content-indent
  devModules+=('remark-lint-checkbox-content-indent')

  # remark-lint-first-heading-level
  # Warn when the first heading has a level other than a specified value.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-lint-first-heading-level
  devModules+=('remark-lint-first-heading-level')

  # remark-lint-linebreak-style
  # Warn when linebreaks violate a given or detected style.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-lint-linebreak-style
  devModules+=('remark-lint-linebreak-style')

  # remark-lint-no-duplicate-headings-in-section
  # Warn when duplicate headings are found, but only when on the same level,
  # “in” the same section.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-lint-no-duplicate-headings-in-section
  devModules+=('remark-lint-no-duplicate-headings-in-section')

  # remark-lint-no-empty-url
  # Warn for empty URLs in links and images.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-lint-no-empty-url
  devModules+=('remark-lint-no-empty-url')

  # remark-lint-no-heading-indent
  # Warn when a heading is indented.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-lint-no-heading-indent
  devModules+=('remark-lint-no-heading-indent')

  # remark-lint-no-heading-like-paragraph
  # Warn when a heading is indented.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-lint-no-heading-indent
  devModules+=('remark-lint-no-heading-like-paragraph')

  # remark-lint-no-html
  # Warn when HTML nodes are used.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-lint-no-html
  devModules+=('remark-lint-no-html')

  # remark-lint-no-missing-blank-lines
  # Warn when missing blank lines before a block node.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-lint-no-missing-blank-lines
  devModules+=('remark-lint-no-missing-blank-lines')

  # remark-lint-no-paragraph-content-indent
  # Warn when the content in paragraphs are indented.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-lint-no-paragraph-content-indent
  devModules+=('remark-lint-no-paragraph-content-indent')

  # remark-lint-no-reference-like-url
  # Warn when URLs are also defined identifiers.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-lint-no-reference-like-url
  devModules+=('remark-lint-no-reference-like-url')

  # remark-lint-no-tabs
  # Warn when hard tabs are used instead of spaces.
  # https://github.com/remarkjs/remark-lint/tree/master/packages/remark-lint-no-tabs
  devModules+=('remark-lint-no-tabs')

  # remark-lint-alphabetize-lists
  # This remark-lint rule was created for free-programming-books-lint to
  # enforce free-programming-books formatting guidelines.
  # https://github.com/vhf/remark-lint-alphabetize-lists
  devModules+=('remark-lint-alphabetize-lists')

  # # remark-lint-appropriate-heading
  # # Check that the top-level heading matches the directory name
  # # https://github.com/RichardLitt/remark-lint-appropriate-heading
  # devModules+=('remark-lint-appropriate-heading')

  # remark-lint-blank-lines-1-0-2
  # This remark-lint rule was created for free-programming-books-lint to
  # enforce free-programming-books formatting guidelines.
  # https://github.com/vhf/remark-lint-blank-lines-1-0-2
  devModules+=('remark-lint-blank-lines-1-0-2')

  # remark-lint-books-links
  # This remark-lint rule was created for free-programming-books-lint to
  # enforce free-programming-books formatting guidelines.
  # https://github.com/vhf/remark-lint-books-links
  devModules+=('remark-lint-books-links')

  # remark-lint-code
  # This is a pluggable remark-lint rule which allows various linters to be run
  # against fenced code blocks in markdown based on their language tag.
  # https://github.com/Qard/remark-lint-code
  devModules+=('remark-lint-code')

  # remark-lint-no-dead-urls
  # Ensure that external links in your Markdown are alive
  # https://github.com/davidtheclark/remark-lint-no-dead-urls
  devModules+=('remark-lint-no-dead-urls')

  # remark-lint-emoji-limit
  # This rule enforces a limit of emojis per paragraph.
  # https://github.com/zerok/remark-lint-emoji-limit
  devModules+=('remark-lint-emoji-limit')

  # remark-lint-no-empty-sections
  # This remark-lint rule was created for free-programming-books-lint to
  # enforce free-programming-books formatting guidelines.
  # https://github.com/vhf/remark-lint-no-empty-sections
  devModules+=('remark-lint-no-empty-sections')

  # remark-lint-heading-length
  # A simple rule for checking the heading length in Markdown documents
  # https://github.com/zerok/remark-lint-heading-length
  devModules+=('remark-lint-heading-length')

  # remark-lint-heading-whitespace
  # Detect non-breaking spaces.
  # https://github.com/vhf/remark-lint-heading-whitespace
  devModules+=('remark-lint-heading-whitespace')

  # remark-lint-are-links-valid-alive
  # Make your links to follow to your rules!
  # https://github.com/wemake-services/remark-lint-are-links-valid/tree/master/packages/alive
  devModules+=('remark-lint-are-links-valid-alive')

  # remark-lint-are-links-valid-duplicate
  # Make your links to follow your rules!
  # https://github.com/wemake-services/remark-lint-are-links-valid/tree/master/packages/duplicate
  devModules+=('remark-lint-are-links-valid-duplicate')

  # # remark-lint-no-url-trailing-slash
  # # This remark-lint rule was created for free-programming-books-lint to
  # # enforce free-programming-books formatting guidelines.
  # # https://github.com/vhf/remark-lint-no-url-trailing-slash
  # devModules+=('remark-lint-no-url-trailing-slash')

  # # remark-lint-write-good
  # # Wrapper for write-good that integrates it into remark-lint.
  # # https://github.com/zerok/remark-lint-write-good
  # devModules+=('remark-lint-write-good')

  # # remark-validate-links
  # # Validate if links point to existing headings and files in markdown
  # # https://github.com/remarkjs/remark-validate-links
  # devModules+=('remark-validate-links')

  yarn add --dev "${devModules[@]}"

  # ----------------------------------------------------------------------------

  local here="$(dirname $0)/../bundle/markdown"

  cp "$here/.remarkrc.js" .

  # ----------------------------------------------------------------------------

  local tmp="$(mktemp)"
  jq '.scripts += { "lint:md": "remark ." }' ./package.json > "$tmp" && mv "$tmp" ./package.json
}