'use strict';

var gulp = require('gulp');
var uglify = require('gulp-uglify');
var concat = require('gulp-concat');
var sass = require('gulp-sass');
var neat = require('node-neat').includePaths;

gulp.task('sass-dev', function() {
  return gulp.src('scss/*.scss')
    .pipe(sass({
      includePaths: ['sass'].concat(neat),
    }))
    .pipe(gulp.dest('static'));
});

gulp.task('sass', function() {
  return gulp.src('scss/*.scss')
    .pipe(sass({
      includePaths: ['sass'].concat(neat),
      outputStyle: 'compressed',
    }))
    .pipe(gulp.dest('static'))
});

var jsScripts = ['javascript/site.js', 'javascript/magnific.js', 'javascript/owl.js',
                 'javascript/site.map.js', 'javascript/site.alltrucks.js', 'javascript/site.truck.js'];

gulp.task('compress', function() {
  return gulp.src(jsScripts)
    .pipe(concat('site.js'))
    .pipe(uglify())
    .pipe(gulp.dest('static'))
});

gulp.task('movejs', function() {
  return gulp.src(jsScripts)
    .pipe(concat('site.js'))
    .pipe(gulp.dest('static'));
});

gulp.task('compress-admin', function() {
  return gulp.src('javascript/admin.js')
    .pipe(uglify())
    .pipe(gulp.dest('static'))
});

gulp.task('movejs-admin', function() {
  return gulp.src(['javascript/admin.js'])
    .pipe(gulp.dest('static'));
});

gulp.task('watch', function() {
    gulp.watch('scss/*.scss', ['sass-dev']);
    gulp.watch('javascript/*.js', ['movejs', 'movejs-admin']);
});

gulp.task('dev', ['watch']);

gulp.task('default', ['sass', 'compress', 'compress-admin']);
