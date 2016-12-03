var chokidar = require('chokidar');

const watcher = chokidar.watch([
  'src/**/test/*.js',
  'src/**/*.test.js',
  'tests/**/*.js',
  '{src,lib}/**/*.{js,coffee}',
  '*.{js,coffee}',
], {
  ignored: [
    'node_modules/**',
    '**/node_modules/**'
  ]
})

watcher.on('all', (event, path) => {
  console.log(event, path);
});
