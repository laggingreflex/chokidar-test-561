Repro for [chokidar issue #561](https://github.com/paulmillr/chokidar/issues/561)

With this directory structure:
```
├─────watch.js
└─────src
      ├─────src.js
      └─────sub
            └─────sub.js
```
and this is the code:
```js
chokidar.watch([
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
```
It doesn't trigger change events for `src/sub/sub.js` file.

Removing the following makes it work again:
```js
  // 'src/**/test/*.js',
  // 'src/**/*.test.js',
  'tests/**/*.js',
  '{src,lib}/**/*.{js,coffee}',
  '*.{js,coffee}',
```

The commented out patterns are causing the problem. Is this a bug, or does the array actually control specificity?

Windows 10, node v7, chokidar: latest github master

