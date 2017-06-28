var gulp     = require('gulp');
var settings = require('../../gulp.json');

gulp.task(
  'lint',
  'Activates linting and other validation.',
  function () {
    settings.linting = true;
  },
  { aliases: ['l'] }
);
