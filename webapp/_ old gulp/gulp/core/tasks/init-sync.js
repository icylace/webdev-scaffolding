var browserSync = require('browser-sync');
var gulp        = require('gulp');
var settings    = require('../../gulp.json');

gulp.task(
  'init-sync',
  'Activates live browser reloading.',
  function () {
    // settings.syncing = true;
    browserSync.init(null, {
      browser: 'google chrome',
      // host:    '10.0.0.1',
      minify:  false,
      proxy:   settings.projectUrl
    });
  },
  { aliases: ['s'] }
);
