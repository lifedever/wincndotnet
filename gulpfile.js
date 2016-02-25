/**
 * Created by gefangshuai on 2016/2/25.
 */
var gulp = require('gulp');
var uglify = require('gulp-uglify');
var minifycss = require('gulp-clean-css');
var rename = require('gulp-rename');
var concat = require('gulp-concat');
var notify = require('gulp-notify');
var bom = require('gulp-bom');

/**
 * js 合并压缩
 */
gulp.task('script', function () {
    gulp.src([
            './public/js/app.js',
            './public/js/share.js'
        ])
        .pipe(uglify({
            compress: true
        }))
        .pipe(rename({
            suffix: '.min'
        }))
        .pipe(bom())
        .pipe(gulp.dest('./public/js'))
        .pipe(notify({message: 'js文件处理完成'}));
});

/**
 * css 合并压缩
 */
gulp.task('cleancss', function () {
    gulp.src([
            './public/css/style.css'
        ])

        .pipe(minifycss())
        .pipe(rename({
            suffix: '.min'
        }))
        .pipe(gulp.dest('./public/css'))
        .pipe(notify({message: 'css文件处理完成'}));
});

gulp.task('default', ['script', 'cleancss']);

gulp.task('watcher', function () {
    gulp.watch("./public/css/*.css", ['cleancss']);
    gulp.watch("./public/js/*.js", ['script']);
});