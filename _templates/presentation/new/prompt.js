module.exports = [
  {
    type: 'input',
    name: 'name',
    message: "What's the name of the presentation?"
  },
  {
    type: 'select',
    name: 'theme',
    initial: 'white',
    choices: [
      'beige',
      'black',
      'blood',
      'league',
      'moon',
      'night',
      'serif',
      'simple',
      'sky',
      'solarized',
      'white',
    ],
    hint: 'Read more: https://github.com/hakimel/reveal.js#theming',
    message: 'Which theme would you like to use?'
  },
  {
    type: 'select',
    name: 'highlightTheme',
    initial: 'color-brewer',
    choices: require('../highlight-themes.json'),
    hint: 'Read more: https://github.com/hakimel/reveal.js#code-syntax-highlighting',
    message: 'Which highlight theme would you like to use?'
  },
  {
    type: 'multiselect',
    name: 'preprocessors',
    hint: '(Use <space> to select, <return> to submit)',
    initial: [
      'samples',
      'emojify',
      'fragments'
    ],
    choices: [
      'samples',
      'emojify',
      'fragments'
    ],
    message: 'Which preprocessors would you like?'
  },
  {
    type: 'numeral',
    name: 'port',
    float: false,
    initial: 2000,
    message: 'Would you like to override the port?'
  }
]
