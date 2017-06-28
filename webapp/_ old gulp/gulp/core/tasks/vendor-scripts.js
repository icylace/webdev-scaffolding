var bowerFiles = require('main-bower-files');
var g          = require('gulp-load-plugins')();
var gulp       = require('gulp');
var lazy       = require('lazypipe');
var base       = require('../helpers/base.js');
var helper     = require('../helpers/scripts-helper.js');
var settings   = require('../../gulp.json');

// // NOTE
// // - Used partly because of current limitation with `gulp-jshint`
// //   in relation to `gulp-if`.
// var lintScripts = lazy()
//   .pipe(g.jshint)
//   .pipe(g.jshint.reporter, 'jshint-stylish-ex');

// var minifyScripts = lazy()
//   // .pipe(g.ngAnnotate)
//   .pipe(g.uglify)
//   .pipe(g.rename, { suffix: '.min' });

gulp.task(
  'vendor-scripts',
  'Assembles 3rd-party scripts.',
  function () {
    gulp.src(bowerFiles({ checkExistence: true, includeDev: true }))
      .pipe(g.plumber())
      .pipe(g.concat('vendor.js'))
      .pipe(g.if(settings.minifying, helper.minify()))
      .pipe(base.place((settings.vendorScripts ? settings.vendorScripts.dest : null), 'Vendor scripts assembled.'));
  },
  { aliases: ['vjs'] }
);
