---
to: .preprocessor/samples.js
skip_if: <%= !preprocessors.includes('samples') %>
---
const fs = require('fs').promises
const fileExtensionRegex = /(?<=\.)[0-9a-z]+$/i;
const sampleRegex = /<sample.*>.*<\/sample>/g
const pathRegex = /(?<=path=").*(?=")/

function getCodeSample(samplePath, filePathToContent) {
  try {
    return [
      `\`\`\`${samplePath.match(fileExtensionRegex)[0]}`,
      filePathToContent[samplePath].trim(),
      `\`\`\``,
    ].join('\n')
  } catch (e) {
    throw new Error(`${samplePath} failed with Error: ${e.stack}`)
  }
}

async function readSampleFiles(samplePaths) {
  const fileContentPairs = await Promise.all(
    samplePaths.map(async (filePath) => {
      const fileContent = await fs.readFile(filePath, 'utf-8');
      return [filePath, fileContent]
    })
  );

  const filePathToContent = fileContentPairs.reduce(
    (acc, curr) => {
      const [path, content] = curr;
      acc[path] = content
      return acc;
    },
    {}
  )

  return filePathToContent
}

async function injectSamples(markdown) {
  const samplePaths = markdown.match(sampleRegex).map((sample) => sample.match(pathRegex)[0])
  const samplePathToContent = await readSampleFiles(samplePaths)

  return markdown.replace(sampleRegex, (replaceValue) => {
    const [path] = replaceValue.match(pathRegex)
    return getCodeSample(path, samplePathToContent)
  })
}

module.exports = injectSamples;
