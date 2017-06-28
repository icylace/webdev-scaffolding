var gulp = require('gulp');
var run  = require('run-sequence');

gulp.task(
  'build',
  'Freshly creates the output files and folders.',
  function () {
    return run('clean', ['assets', 'templates', 'scripts', 'styles', 'vendor-scripts', 'vendor-styles']);
  },
  { aliases: ['b'] }
);
