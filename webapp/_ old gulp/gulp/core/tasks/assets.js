var gulp = require('gulp');
var run  = require('run-sequence');

gulp.task(
  'assets',
  'Assembles the assets.',
  function () {
    return run(['fonts', 'images']);
  },
  { aliases: ['a'] }
);
