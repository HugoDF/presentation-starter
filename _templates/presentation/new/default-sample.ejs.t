---
to: samples/10-sample.js
skip_if: <%= !preprocessors.includes('samples') %>
---
fetch('https://jsonplaceholder.typicode.com/todos')
  .then((res) => res.json())
  .then((data) => console.log(data))
  .catch(console.error)
