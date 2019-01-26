---
to: .preprocessor/emojify.js
skip_if: <%= !preprocessors.includes('emojify') %>
---
const emoji = require('node-emoji')

const headingTextRegex = /(?<=#)#+.*/g
const emojifyAbleRegex = /:\w*:/

function emojify(markdown) {
  return markdown.replace(
    headingTextRegex,
    (headingText) => headingText.search(emojifyAbleRegex) > -1
      ? emoji.emojify(headingText)
      : `${headingText} ${emoji.random().emoji}`
  )
}

module.exports = emojify;
