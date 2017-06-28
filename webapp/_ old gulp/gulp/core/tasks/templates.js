var g        = require('gulp-load-plugins')();
var gulp     = require('gulp');
var lazy     = require('lazypipe');
var base     = require('../helpers/base.js');
var settings = require('../../gulp.json');

var minifyHtml = lazy()
  .pipe(g.htmlmin, {
    collapseBooleanAttributes:    true,
    collapseWhitespace:           true,
    removeAttributeQuotes:        true,
    removeCDATASectionsFromCDATA: true,
    removeComments:               true,
    removeCommentsFromCDATA:      true,
    removeEmptyAttributes:        true,
    removeRedundantAttributes:    true,
    removeOptionalTags:           true,
    useShortDoctype:              true
  });

// `gulp-w3cjs` needs to be executed last in a pipeline which is why
// we're using `lazypipe` to get it to work during a series of pipes.
var lintHtml = lazy()
  .pipe(g.w3cjs);

gulp.task(
  'templates',
  'Compiles the markup templates.',
  function () {
    gulp.src(settings.templates.src)
      .pipe(g.plumber())
      // .pipe(g.jade())
      .pipe(g.if(settings.linting, lintHtml()))
      .pipe(g.if(settings.minifying, minifyHtml()))
      .pipe(g.flatten())
      // .pipe(g.angularTemplatecache({ module: 'appModule' }))
      .pipe(base.place(settings.templates.dest, 'Templates compiled.'));
  },
  { aliases: ['t'] }
);
