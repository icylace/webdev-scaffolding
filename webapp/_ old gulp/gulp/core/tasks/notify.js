var gulp     = require('gulp');
var settings = require('../../gulp.json');

gulp.task(
  'notify',
  'Activates system message notification.',
  function () {
    settings.notifying = true;
  },
  { aliases: ['n'] }
);
