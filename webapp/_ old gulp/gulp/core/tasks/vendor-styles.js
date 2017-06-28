var g        = require('gulp-load-plugins')();
var gulp     = require('gulp');
var lazy     = require('lazypipe');
var nib      = require('nib');
var base     = require('../helpers/base.js');
var helper   = require('../helpers/styles-helper.js');
var settings = require('../../gulp.json');

gulp.task(
  'vendor-styles',
  'Assembles 3rd-party styles.',
  function () {
    gulp.src(settings.vendorStyles.src)
      .pipe(g.concat('vendor.css'))
      .pipe(g.if(settings.minifying, helper.minify()))
      .pipe(base.place(settings.vendorStyles.dest, 'Vendor styles assembled.'));
  },
  { aliases: ['vcss'] }
);
