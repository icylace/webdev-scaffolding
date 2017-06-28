var gulp = require('gulp');
var run  = require('run-sequence');

gulp.task(
  'go',
  'Builds the project and initiates watching with browser sync.',
  function () {
    return run('build', 'init-sync', 'watch');
  }
);
