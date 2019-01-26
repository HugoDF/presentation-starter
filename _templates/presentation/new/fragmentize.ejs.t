---
to: .preprocessor/fragmentize
skip_if: <%= !preprocessors.includes('fragments') %>
---
const fragmentRegex = /<fragment.*>.*<\/fragment>/g

const fragmentize = (markdown) => markdown.replace(
  fragmentRegex,
  (fragmentContent) => `<div class="fragment">${fragmentContent}</div>`
);

module.exports = fragmentize;
