var gulp     = require('gulp');
var run      = require('run-sequence');
var settings = require('../../gulp.json');

gulp.task(
  'default',
  'Shows the help screen or runs the given default task in gulp.json if it is defined.',
  function () {
    return settings.defaultTask ? run(settings.defaultTask) : run('help');
  }
);
