var del      = require('del');
var gulp     = require('gulp');
var settings = require('../../gulp.json');

gulp.task(
  'clean',
  'Removes the output files and folders.',
  function () {
    del(settings.cleanablePaths, { dot: true });
  },
  { aliases: ['c'] }
);
