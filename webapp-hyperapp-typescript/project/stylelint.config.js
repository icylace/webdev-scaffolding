"use strict"

const propertiesOrder = require("./stylelint-order-properties.js")

// https://stylelint.io/user-guide/rules/

module.exports = {
  plugins: [
    "stylelint-csstree-validator",
    "stylelint-declaration-block-no-ignored-properties",
    "stylelint-declaration-strict-value",
    "stylelint-images",
    "stylelint-no-browser-hacks/lib",
    "stylelint-no-unsupported-browser-features",
    "stylelint-order",
  ],
  extends: [
    // We're explicitly extending `stylelint-config-recommended` even though
    // it's already included with `stylelint-config-standard` so that the
    // `stylelint-find-unused-rules` package.json script recognizes that
    // it is being used.
    "stylelint-config-recommended",
    "stylelint-config-standard",
    "stylelint-config-prettier",
  ],
  rules: {
    "at-rule-blacklist": "extend",
    "at-rule-no-vendor-prefix": true,
    "at-rule-whitelist": null,
    "block-no-empty": true,
    "color-hex-length": "long",
    "color-named": "never",
    "color-no-hex": null,
    "color-no-invalid-hex": true,
    "comment-no-empty": true,
    "comment-word-blacklist": "/^TODO:/",
    "custom-media-pattern": "media-.+",
    "custom-property-pattern": null,
    "declaration-no-important": true,
    "declaration-property-unit-blacklist": {
      "font-size": ["px"],
    },
    "declaration-property-unit-whitelist": null,
    "declaration-property-value-blacklist": null,
    "declaration-property-value-whitelist": null,
    "font-family-no-missing-generic-family-keyword": true,
    "font-family-name-quotes": "always-unless-keyword",
    "font-family-no-duplicate-names": true,
    "font-weight-notation": "named-where-possible",
    "function-blacklist": null,
    "function-calc-no-unspaced-operator": true,
    "function-linear-gradient-no-nonstandard-direction": true,
    "function-url-no-scheme-relative": true,
    "function-url-quotes": "always",
    "function-url-scheme-blacklist": ["ftp", "/^http:/"],
    "function-url-scheme-whitelist": ["data", "/^https:/"],
    "function-whitelist": null,
    "keyframe-declaration-no-important": true,
    "max-nesting-depth": 3,
    "media-feature-name-blacklist": null,
    "media-feature-name-no-unknown": true,
    "media-feature-name-no-vendor-prefix": true,
    "media-feature-name-whitelist": null,
    "media-feature-range-operator-space-after": "always",
    "media-feature-range-operator-space-before": "always",
    "no-unknown-animations": true,
    "number-max-precision": 4,
    "property-blacklist": null,
    "property-no-vendor-prefix": true,
    "property-whitelist": null,
    "selector-attribute-operator-blacklist": null,
    "selector-attribute-operator-whitelist": null,
    "selector-attribute-operator-space-after": "never",
    "selector-attribute-operator-space-before": "never",
    "selector-class-pattern": null,
    "selector-combinator-blacklist": null,
    "selector-combinator-whitelist": null,
    "selector-id-pattern": null,
    "selector-max-attribute": 2,
    "selector-max-class": 3,
    "selector-max-combinators": 3,
    "selector-max-compound-selectors": 3,
    "selector-max-id": 0,
    "selector-max-specificity": "0,6,3",
    "selector-max-type": 3,
    "selector-max-universal": 2,
    "selector-nested-pattern": null,
    "selector-no-qualifying-type": null,
    "selector-no-vendor-prefix": true,
    "selector-pseudo-class-blacklist": null,
    "selector-pseudo-class-whitelist": null,
    "selector-pseudo-element-blacklist": null,
    "selector-pseudo-element-whitelist": null,
    "shorthand-property-no-redundant-values": true,
    "string-quotes": "double",
    "time-min-milliseconds": null,
    "unit-blacklist": null,
    "unit-whitelist": null,
    "value-keyword-case": "lower",
    "value-no-vendor-prefix": true,

    // https://github.com/csstree/stylelint-validator#usage
    "csstree/validator": true,

    // https://github.com/kristerkari/stylelint-declaration-block-no-ignored-properties#usage
    "plugin/declaration-block-no-ignored-properties": true,

    // https://github.com/AndyOGo/stylelint-declaration-strict-value#usage
    "scale-unlimited/declaration-strict-value": [["/color/", "font-size"]],

    // https://github.com/ramasilveyra/stylelint-images#usage
    "images/broken": true,
    "images/prefer-data-uri": 256,

    // https://github.com/Slamdunk/stylelint-no-browser-hacks#usage
    "plugin/no-browser-hacks": [true, { browsers: ["last 2 versions", "ie >= 11"] }],

    // https://github.com/ismay/stylelint-no-unsupported-browser-features#usage
    "plugin/no-unsupported-browser-features": [
      true,
      {
        browsers: ["last 2 versions", "ie >= 11"],
        severity: "warning",
      },
    ],

    // https://github.com/hudochenkov/stylelint-order#list-of-rules
    "order/order": [
      "less-mixins",
      "custom-properties",
      "dollar-variables",
      "at-variables",
      "declarations",
      "rules",
      "at-rules",
    ],
    // TODO: take advantage of this:
    "order/properties-order": [propertiesOrder, { disableFix: true }],
    "order/properties-alphabetical-order": null,
  },
}
