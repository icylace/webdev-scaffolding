var browserSync = require('browser-sync');
var g           = require('gulp-load-plugins')();
var gulp        = require('gulp');
var multipipe   = require('multipipe');
var settings    = require('../../gulp.json');

var place = function (dest, message) {
  message = message || 'Done';

  var stream = multipipe(
    g.if(settings.compressing, g.gzip({ level: 9, memLevel: 9 })),
    g.size({ showFiles: true }),
    gulp.dest(dest || settings.defaultDest),
    g.if(settings.notifying, g.notify(message)),
    g.if(settings.syncing, browserSync.reload({ stream: true }))
  );

  stream.on('error', function (err) {
    g.util.log(err);
  });

  return stream;
}

module.exports = {
  place: place,
  settings: {
    compressing: settings.compressing,
    linting:     settings.linting,
    minifying:   settings.minifying,
    notifying:   settings.notifying,
    syncing:     settings.syncing
  }
};
