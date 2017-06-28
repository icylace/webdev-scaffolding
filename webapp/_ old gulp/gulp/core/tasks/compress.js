var gulp     = require('gulp');
var settings = require('../../gulp.json');

gulp.task(
  'compress',
  'Activates image compression.',
  function () {
    settings.compressing = true;
  },
  { aliases: ['p'] }
);
