---
to: presentation.md
---
---
title: <%= name %>
theme: <%= theme %>
revealOptions:
  controls: false
---

# <%= name %>

---
Table of contents

<% if(preprocessors.includes('emojify')) { %>
---

## Headings get an emoji appended to them

---

## Unless you already have one :smile:

<% } %>

<% if(preprocessors.includes('samples')) { %>
---
## You can inject samples

Using "sample" tags with a "path" property

<sample path="./samples/10-sample.js"></sample>

<% } %>

<% if(preprocessors.includes('fragments')) { %>

---

## You can make things fragments

By using the "fragment" tag around it:

<fragment>This is a fragment</fragment>
<% } %>

