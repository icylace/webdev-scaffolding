var g    = require('gulp-load-plugins')();
var lazy = require('lazypipe');

var lintStyles = lazy()
  .pipe(g.csslint, '.csslintrc')
  .pipe(g.csslint.reporter);

var minifyStyles = lazy()
  .pipe(g.pleeease)
  .pipe(g.rename, { suffix: '.min' });

module.exports = {
  lint:   lintStyles,
  minify: minifyStyles
};
