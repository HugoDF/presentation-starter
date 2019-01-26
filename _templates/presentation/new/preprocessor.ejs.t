---
to: .preprocessor/preprocessor.js
---
const preprocessors = [
  <% if(preprocessors.includes('samples')) { %>require('./samples'),<% } %>
  <% if(preprocessors.includes('emojify')) { %>require('./emojify'),<% } %>
  <% if(preprocessors.includes('fragments')) { %>require('./fragmentize'),<% } %>
];

async function preprocessor(markdown, /* options */) {
  let output = markdown
  for (const processor of preprocessors) {
    output = await processor(output)
  }
  return output
}

module.exports = preprocessor
