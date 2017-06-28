var gulp     = require('gulp');
var settings = require('../../gulp.json');

gulp.task(
  'minify',
  'Activates minification.',
  function () {
    settings.minifying = true;
  },
  { aliases: ['m'] }
);
