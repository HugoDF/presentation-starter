---
to: package.json
---
{
  "scripts": {
    "start": "reveal-md --port 2000 --preprocessor .preprocessor/preprocessor.js --highlight-theme <%= highlightTheme %> presentation.md",
    "dev": "npm start -- -w",
    "build": "reveal-md presentation.md --preprocessor .preprocessor/preprocessor.js --highlight-theme <%= highlightTheme %> --static static",
    "print": "reveal-md --preprocessor .preprocessor/preprocessor.js --highlight-theme <%= highlightTheme %> presentation.md --print <%= name %>.pdf"
  },
  "dependencies": {
    <% if(preprocessors.includes('emojify')) { %>
    "node-emoji": "^1.8.1",
    <% } %>
    "reveal-md": "^2.4.0"
  },
  "devDependencies": {
    "hygen": "^2.1.1"
  }
}
