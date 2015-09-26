'use strict';

var watchify = require('watchify');
var browserify = require('browserify');
var gulp = require('gulp');
var source = require('vinyl-source-stream');
var buffer = require('vinyl-buffer');
var gutil = require('gulp-util');
var sourcemaps = require('gulp-sourcemaps');
var assign = require('lodash.assign');
var coffeeify = require('coffeeify');
var sass = require('gulp-sass');

// add custom browserify options here
var customOpts = {
  entries: ['js/main.coffee'],
  extensions: ['.coffee'],
  debug: true
};
var opts = assign({}, watchify.args, customOpts);
var b = watchify(browserify(opts));


// add transformations here
b.transform(coffeeify);

gulp.task('default', ['main', 'watch-sass']); // so you can run `gulp js` to build the file
gulp.task('main', bundle);
gulp.task('sass', function(){
  gulp.src('sass/*.scss')
    .pipe(sass({ indentedSyntax: true }).on('error', sass.logError))
    .pipe(gulp.dest('./css/'))
});
gulp.task('watch-sass', function () {
  return gulp.watch('sass/**/*.scss', ['sass']);
});
b.on('update', bundle); // on any dep update, runs the bundler
b.on('log', gutil.log); // output build logs to terminal

function bundle() {
  return b.bundle()
    // log errors if they happen
    .on('error', gutil.log.bind(gutil, 'Browserify Error'))
    .pipe(source('main.js'))
    // optional, remove if you don't need to buffer file contents
    .pipe(buffer())
    // optional, remove if you dont want sourcemaps
    // .pipe(sourcemaps.init({loadMaps: true})) // loads map from browserify file
       // Add transformation tasks to the pipeline here.
    .pipe(sourcemaps.write('./')) // writes .map file
    .pipe(gulp.dest('./js/build'));
}
