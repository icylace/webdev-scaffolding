"use strict"

// Based on:
// https://9elements.com/css-rule-order/
// https://github.com/brandon-rhodes/Concentric-CSS/blob/master/style3.css

module.exports = [
  // CSS Miscellaneous
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Miscellaneous
  {
    emptyLineBefore: "always",
    properties: ["all", "text-rendering"],
  },

  // CSS Generated Content
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Generated_Content
  {
    emptyLineBefore: "always",
    properties: ["content", "quotes"],
  },

  // CSS Positioned Layout
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning
  {
    emptyLineBefore: "always",
    properties: ["position", "z-index", "top", "right", "bottom", "left", "float", "clear"],
  },

  // CSS Display
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Display
  {
    emptyLineBefore: "always",
    properties: ["display"],
  },

  // CSS Flexible Box Layout
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout
  // https://css-tricks.com/snippets/css/a-guide-to-flexbox/
  {
    emptyLineBefore: "always",
    properties: [
      // Flex container properties.
      "flex-flow",
      "flex-direction",
      "flex-wrap",
      "justify-content",
      "align-items",
      "align-content",

      // Flex item properties.
      "order",
      "flex",
      "flex-grow",
      "flex-shrink",
      "flex-basis",
      "align-self",
    ],
  },

  // CSS Transforms
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transforms
  {
    emptyLineBefore: "always",
    properties: [
      "backface-visibility",
      "perspective",
      "perspective-origin ",
      "transform",
      "transform-box",
      "transform-origin",
      "transform-style",
    ],
  },

  // CSS Masking
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Masking
  {
    emptyLineBefore: "always",
    properties: [
      "clip",
      "clip-path",
      "mask",
      "mask-image",
      "mask-mode",
      "mask-position",
      "mask-size",
      "mask-repeat",
      "mask-origin",
      "mask-clip",
      "mask-composite",
      "mask-type",
    ],
  },

  // CSS Animations
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations
  {
    emptyLineBefore: "always",
    properties: [
      "animation",
      "animation-name",
      "animation-duration",
      "animation-timing-function",
      "animation-delay",
      "animation-iteration-count",
      "animation-direction",
      "animation-fill-mode",
      "animation-play-state",
    ],
  },

  // CSS Transitions
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transitions
  {
    emptyLineBefore: "always",
    properties: [
      "transition",
      "transition-delay",
      "transition-duration",
      "transition-property",
      "transition-timing-function",
    ],
  },

  // CSS Basic Box Model
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model
  {
    emptyLineBefore: "always",
    properties: [
      "visibility",

      "margin",
      "margin-top",
      "margin-right",
      "margin-bottom",
      "margin-left",

      "padding",
      "padding-top",
      "padding-right",
      "padding-bottom",
      "padding-left",

      "box-sizing",

      "width",
      "min-width",
      "max-width",

      "height",
      "min-height",
      "max-height",

      "overflow",
      "overflow-x",
      "overflow-y",

      "overscroll-behavior",
      "overscroll-behavior-x",
      "overscroll-behavior-y",
    ],
  },

  // CSS Backgrounds and Borders
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Backgrounds_and_Borders
  {
    emptyLineBefore: "always",
    properties: [
      "border",
      "border-width",
      "border-style",
      "border-color",

      "border-top",
      "border-top-width",
      "border-top-style",
      "border-top-color",

      "border-right",
      "border-right-width",
      "border-right-style",
      "border-right-color",

      "border-bottom",
      "border-bottom-width",
      "border-bottom-style",
      "border-bottom-color",

      "border-left",
      "border-left-width",
      "border-left-style",
      "border-left-color",

      "border-image",
      "border-image-source",
      "border-image-slice",
      "border-image-width",
      "border-image-outset",
      "border-image-repeat",

      "border-radius",
      "border-top-left-radius",
      "border-top-right-radius",
      "border-bottom-right-radius",
      "border-bottom-left-radius",

      "box-shadow",

      "background",
      "background-image",
      "background-position",
      "background-position-x",
      "background-position-y",
      "background-size",
      "background-repeat",
      "background-origin",
      "background-clip",
      "background-attachment",
      "background-color",
    ],
  },

  // CSS Logical Properties and Values
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Logical_Properties
  {
    emptyLineBefore: "always",
    properties: [
      "margin-block-start",
      "margin-block-end",
      "margin-inline-start",
      "margin-inline-end",

      "padding-block-start",
      "padding-block-end",
      "padding-inline-start",
      "padding-inline-end",

      "border-block-start",
      "border-block-start-width",
      "border-block-start-style",
      "border-block-start-color",
      "border-block-end",
      "border-block-end-width",
      "border-block-end-style",
      "border-block-end-color",
      "border-inline-start",
      "border-inline-start-width",
      "border-inline-start-style",
      "border-inline-start-color",
      "border-inline-end",
      "border-inline-end-width",
      "border-inline-end-style",
      "border-inline-end-color",

      "block-size",
      "min-block-size",
      "max-block-size",

      "inline-size",
      "min-inline-size",
      "max-inline-size",

      "offset-block-end",
      "offset-block-start",
      "offset-inline-end",
      "offset-inline-start",
    ],
  },

  // CSS Images
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Images
  {
    emptyLineBefore: "always",
    properties: ["image-orientation", "image-rendering", "object-fit", "object-position"],
  },

  // CSS Fonts
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Fonts
  {
    emptyLineBefore: "always",
    properties: [
      "font",
      "font-style",
      "font-variant",
      "font-weight",
      "font-stretch",
      "font-size",
      "font-size-adjust",
      "line-height",
      "line-height-step",
      "font-family",

      "font-variant",
      "font-variant-caps",
      "font-variant-numeric",
      "font-variant-alternates",
      "font-variant-ligatures",
      "font-variant-east-asian",
      "font-variant-position",
      "font-variation-settings",

      "font-kerning",
      "font-language-override",
      "font-synthesis",
      "font-feature-settings",
    ],
  },

  // ---------------------------------------------------------------------------

  // CSS Text
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Text
  {
    emptyLineBefore: "always",
    properties: [
      "tab-size",
      "text-align",
      "text-align-last",
      "text-justify",
      "text-indent",
      "text-transform",
      "text-size-adjust",
      "letter-spacing",
      "white-space",
      "line-break",
      "word-spacing",
      "word-break ",
      "word-wrap",
      "overflow-wrap",
      "hanging-punctuation",
      "hyphens",
    ],
  },

  // CSS Text Decoration
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Text_Decoration
  {
    emptyLineBefore: "always",
    properties: [
      "text-decoration",
      "text-decoration-line",
      "text-decoration-style",
      "text-decoration-color",
      "text-decoration-skip",
      "text-decoration-skip-ink",
      "text-emphasis",
      "text-emphasis-style",
      "text-emphasis-color",
      "text-emphasis-position",
      "text-shadow",
      "text-underline-position",
    ],
  },

  // CSS Writing Modes
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Writing_Modes
  {
    emptyLineBefore: "always",
    properties: ["direction", "unicode-bidi", "writing-mode", "text-combine-upright", "text-orientation"],
  },

  // CSS Color
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Color
  {
    emptyLineBefore: "always",
    properties: ["color", "opacity"],
  },

  // CSS Lists
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Lists_and_Counters
  {
    emptyLineBefore: "always",
    properties: ["list-style", "list-style-type", "list-style-position", "list-style-image"],
  },

  // CSS Counter Styles
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Counter_Styles
  {
    emptyLineBefore: "always",
    properties: ["counter-increment", "counter-reset"],
  },

  // CSS Table
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Table
  {
    emptyLineBefore: "always",
    properties: ["table-layout", "border-collapse", "border-spacing", "empty-cells", "caption-side", "vertical-align"],
  },

  // CSS Multi-column Layout
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Columns
  {
    emptyLineBefore: "always",
    properties: [
      "columns",
      "column-width",
      "column-count",
      "column-gap",
      "column-fill",
      "column-rule",
      "column-rule-width",
      "column-rule-style",
      "column-rule-color",
      "column-span",
    ],
  },

  // CSS Fragmentation
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Fragmentation
  {
    emptyLineBefore: "always",
    properties: ["box-decoration-break", "break-before", "break-after", "break-inside", "orphans", "widows"],
  },

  // CSS Basic User Interface
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Basic_User_Interface
  {
    emptyLineBefore: "always",
    properties: [
      "outline",
      "outline-width",
      "outline-offset",
      "outline-style",
      "outline-color",
      "text-overflow",
      "caret-color",
      "cursor",
      "resize",
      "user-select",
    ],
  },

  // CSSOM View
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSSOM_View
  {
    emptyLineBefore: "always",
    properties: ["scroll-behavior"],
  },

  // CSS Shapes
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Shapes
  {
    emptyLineBefore: "always",
    properties: ["shape-image-threshold", "shape-margin", "shape-outside"],
  },

  // CSS Paged Media
  // https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Pages
  {
    emptyLineBefore: "always",
    properties: ["page-break-before", "page-break-after", "page-break-inside"],
  },
]
