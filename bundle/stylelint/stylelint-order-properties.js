"use strict"

// https://9elements.com/css-rule-order/
// https://github.com/brandon-rhodes/Concentric-CSS/blob/master/style3.css

// -----------------------------------------------------------------------------

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Miscellaneous
const cssMiscellaneous = {
  emptyLineBefore: "always",
  properties: ["all", "text-rendering"],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Generated_Content
const cssGeneratedContent = {
  emptyLineBefore: "always",
  properties: ["content", "quotes"],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning
const cssPositionedLayout = {
  emptyLineBefore: "always",
  properties: ["position", "z-index", "top", "right", "bottom", "left", "float", "clear"],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Display
const cssDisplay = {
  emptyLineBefore: "always",
  properties: ["display"],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout
// https://css-tricks.com/snippets/css/a-guide-to-flexbox/
const cssFlexibleBoxLayout = {
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
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transforms
const cssTransforms = {
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
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Masking
const cssMasking = {
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
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations
const cssAnimations = {
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
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transitions
const cssTransitions = {
  emptyLineBefore: "always",
  properties: [
    "transition",
    "transition-delay",
    "transition-duration",
    "transition-property",
    "transition-timing-function",
  ],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model
const cssBasicBoxModel = {
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
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Backgrounds_and_Borders
const cssBackgroundsAndBorders = {
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
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Logical_Properties
const cssLogicalPropertiesAndValues = {
  emptyLineBefore: "always",
  properties: [
    "margin-block-start",
    "margin-block-end",
    "margin-inline-start",
    "margin-inline-end",

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

    "padding-block-start",
    "padding-block-end",
    "padding-inline-start",
    "padding-inline-end",

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
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Images
const cssImages = {
  emptyLineBefore: "always",
  properties: ["image-orientation", "image-rendering", "object-fit", "object-position"],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Fonts
const cssFonts = {
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
    "font-variation-propertyOrderSettings",

    "font-kerning",
    "font-language-override",
    "font-synthesis",
    "font-feature-propertyOrderSettings",
  ],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Text
const cssText = {
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
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Text_Decoration
const cssTextDecoration = {
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
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Writing_Modes
const cssWritingModes = {
  emptyLineBefore: "always",
  properties: ["direction", "unicode-bidi", "writing-mode", "text-combine-upright", "text-orientation"],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Color
const cssColor = {
  emptyLineBefore: "always",
  properties: ["color", "opacity"],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Lists_and_Counters
const cssLists = {
  emptyLineBefore: "always",
  properties: ["list-style", "list-style-type", "list-style-position", "list-style-image"],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Counter_Styles
const cssCounterStyles = {
  emptyLineBefore: "always",
  properties: ["counter-increment", "counter-reset"],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Table
const cssTable = {
  emptyLineBefore: "always",
  properties: ["table-layout", "border-collapse", "border-spacing", "empty-cells", "caption-side", "vertical-align"],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Columns
const cssMultiColumnLayout = {
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
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Fragmentation
const cssFragmentation = {
  emptyLineBefore: "always",
  properties: ["box-decoration-break", "break-before", "break-after", "break-inside", "orphans", "widows"],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Basic_User_Interface
const cssBasicUserInterface = {
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
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSSOM_View
const cssomView = {
  emptyLineBefore: "always",
  properties: ["scroll-behavior"],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Shapes
const cssShapes = {
  emptyLineBefore: "always",
  properties: ["shape-image-threshold", "shape-margin", "shape-outside"],
}

// https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Pages
const cssPagedMedia = {
  emptyLineBefore: "always",
  properties: ["page-break-before", "page-break-after", "page-break-inside"],
}

// -----------------------------------------------------------------------------

module.exports = [
  cssMiscellaneous,
  cssGeneratedContent,
  cssPositionedLayout,
  cssDisplay,
  cssFlexibleBoxLayout,
  cssTransforms,
  cssMasking,
  cssAnimations,
  cssTransitions,
  cssBasicBoxModel,
  cssBackgroundsAndBorders,
  cssLogicalPropertiesAndValues,
  cssImages,
  cssFonts,
  cssText,
  cssTextDecoration,
  cssWritingModes,
  cssColor,
  cssLists,
  cssCounterStyles,
  cssTable,
  cssMultiColumnLayout,
  cssFragmentation,
  cssBasicUserInterface,
  cssomView,
  cssShapes,
  cssPagedMedia,
]
