'use strict';

var gulp = require('gulp');
var uglify = require('gulp-uglify');
var sass = require('gulp-sass');
var neat = require('node-neat').includePaths;
var sourcemaps = require('gulp-sourcemaps');

gulp.task('sass-dev', function() {
  return gulp.src('scss/*.scss')
    .pipe(sass({
      includePaths: ['sass'].concat(neat),
      sourceMap: '.',
    }))
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest('static'));
});

gulp.task('sass', function() {
  return gulp.src('scss/*.scss')
    .pipe(sass({
      includePaths: ['sass'].concat(neat),
      outputStyle: 'compressed',
    }))
    .pipe(gulp.dest('static'));
});

gulp.task('compress', function() {
  return gulp.src('javascript/site.js')
    .pipe(uglify())
    .pipe(gulp.dest('static'));
});

gulp.task('movejs', function() {
  return gulp.src('javascript/*.js')
    .pipe(gulp.dest('static'));
});

gulp.task('compress-admin', function() {
  return gulp.src('javascript/admin.js')
    .pipe(uglify())
    .pipe(gulp.dest('static'));
});

gulp.task('watch', function() {
    gulp.watch('scss/*.scss', ['sass-dev']);
    gulp.watch('javascript/*.js', ['movejs']);
});

gulp.task('dev', ['watch']);

gulp.task('default', ['sass', 'compress', 'compress-admin']);
