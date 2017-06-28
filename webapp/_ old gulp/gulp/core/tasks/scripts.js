var g        = require('gulp-load-plugins')();
var gulp     = require('gulp');
var lazy     = require('lazypipe');
var base     = require('../helpers/base.js');
var helper   = require('../helpers/scripts-helper.js');
var settings = require('../../gulp.json');

gulp.task(
  'scripts',
  'Compiles scripts.',
  function () {
    gulp.src(settings.scripts.src)
      .pipe(g.plumber())
      // .pipe(g.livescript({ bare: true }))
      // .pipe(g.cached('scripts'))
      // .pipe(g.rename('most-of-main.js'))
      // .pipe(g.src('public/app/templates.js'))
      // .pipe(g.order(['most-of-main.js', 'public/templates.js']))
      // .pipe(gulp.dest(settings.tmp))
      // .pipe(g.if(base.settings.linting, lint_scripts()))
      // .pipe(g.remember('scripts'))
      .pipe(g.concat('main.js'))
      .pipe(g.if(settings.linting, helper.lint()))
      .pipe(g.header(';(function (document, window, undefined) { "use strict";'))
      .pipe(g.footer('})(document, window);'))

      // Not sure if stripping debug statements from vendor code is always
      // safe so that's why this is here and not with the minifying code
      // common to both custom code and vendor code.
      .pipe(g.if(settings.minifying, g.stripDebug()))

      .pipe(g.if(settings.minifying, helper.minify()))
      .pipe(base.place(settings.scripts.dest, 'Scripts compiled.'));
  },
  { aliases: ['js'] }
);
