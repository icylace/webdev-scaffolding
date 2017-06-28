Heavily influenced by:

- https://github.com/greypants/gulp-starter
- http://viget.com/extend/gulp-browserify-starter-faq


The Gulp file references tasks that are stored in the "gulp/core/tasks" folder.  Create additional custom tasks in the "gulp/custom/tasks" folder.

The following plugins are used:

browser-sync      - Reloads browsers when changes occur.
del               - Removes files and folders.
gulp              - The streaming build system.
gulp-adhoc        - Easy sequential & parallel task composition
                    on the command-line.
gulp-concat       - Concatenates files.
gulp-csslint      - Lints CSS.
gulp-flatten      - Removes or changes relative paths for files.
gulp-footer       - Adds a footer to the file(s) in the stream.
gulp-gzip         - Compresses files.
gulp-header       - Adds a header to the file(s) in the stream.
gulp-help         - Adds "help" task and the ability to provide help text to your Gulp tasks.
gulp-htmlmin      - Minifies HTML.
gulp-if           - Conditionally runs a stream.
gulp-imagemin     - Compresses images.
gulp-jade         - Transpiles Jade into HTML.
gulp-jshint       - Lints JavaScript.
gulp-load-plugins - Automatically load Gulp plugins.
gulp-load-utils   - A collection of utilities.
gulp-newer        - Only passes through newer files.
gulp-notify       - Sends notification messages.
gulp-pleeease     - Post-processes CSS.
gulp-plumber      - Attempts to prevent streams from crashing.
gulp-rename       - Renames files and folders.
gulp-size         - Displays file sizes.
gulp-template     - Renders Lo-Dash templates.
gulp-uglify       - Minifies JavaScript.
gulp-w3cjs        - Validates HTML.
gulp-watch        - A better alternative to `gulp.watch()`.
jshint-stylish-ex - Stylish reporter for JSHint with styling options.
lazypipe          - Creates reusable partial pipelines.
main-bower-files  - Builds an array of your bower packages' main files.
multipipe         - Creates duplex streams and handles errors in one place.
                    Required by pipeline from gulp-load-utils.
nib               - A Stylus library.
run-sequence      - Runs a series of potentially non-dependent tasks in order.




gulp-angular-templatecache - Concatenates and registers AngularJS templates
                             in the $templateCache.
gulp-livescript   - Transpiles LiveScript into JavaScript.
gulp-ng-annotate  - Adds AngularJS dependency injection annotations.
gulp-order        - Reorders files in a stream.
jade              - A language which transpiles to HTML.
LiveScript        - A language which transpiles to JavaScript.
minimist          - Parses argument options.  Required by env
                    from gulp-load-utils.





TODO
- make "compressing" flag activate "minifying" flag
- shift Stylus compilation to Pleeease
  - gulp-stylus       - Transpiles Stylus into CSS.
- compare gulp-csso and gulp-pleeease
  - gulp-csso         - Minifies CSS.
- compare pipe-joint, multipipe, and lazypipe
  - does multipipe still have a files problem ?
  - pipe-joint        - Allows for minimal pipe notation.
- tmp folder workflow with caching
- get bless working
- consider using these modules:
  gulp-bless       - Splits CSS suitably for IE.
  gulp-cache       - Uses temporary files for caching.
  gulp-cached      - An in-memory file cache.
  gulp-lintspaces  - Checks spaces in files.
  gulp-preprocess  - Preprocesses files based on context or environment.
  gulp-remember    - Adds previously seen files back into the stream.
  gulp-strip-debug - Removes debugging statements.
  gulp-todo        - "Generate a TODO.md file from comments of files in stream"
  https://github.com/pgilad/gulp-todo
