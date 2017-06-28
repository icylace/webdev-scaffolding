var g        = require('gulp-load-plugins')();
var gulp     = require('gulp');
var nib      = require('nib');
var base     = require('../helpers/base.js');
var helper   = require('../helpers/styles-helper.js');
var settings = require('../../gulp.json');

// gulp.task(
//   'bless',
//   'Breaks up CSS files if necessary in order to work around IE limitations.',
//   function () {
//     gulp.src((settings.styles.dest || settings.default_dest) + '/main.css')
//       .pipe(g.bless({ imports: true }))
//       .pipe(gulp.dest(settings.tmp + '/css-bless'));
//   }
// );

gulp.task(
  'styles',
  'Compiles styles.',
  function () {
    gulp.src(settings.styles.src)
      .pipe(g.plumber())
      .pipe(g.stylus({ use: [nib()] }))
      // .pipe(g.cached('styles'))
      // .pipe(g.remember('styles'))
      .pipe(g.if(settings.linting, helper.lint()))
      .pipe(g.if(settings.minifying, helper.minify()))
      .pipe(base.place(settings.styles.dest, 'Styles compiled.'));
  },
  { aliases: ['css'] }
);
