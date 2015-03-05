gulp = require 'gulp'
sass = require 'gulp-ruby-sass'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'
minify_css = require 'gulp-minify-css'
webserver = require 'gulp-webserver'
bower = require 'main-bower-files'
concat = require 'gulp-concat'
svg2png = require 'gulp-svg2png'
prefix = require 'gulp-autoprefixer'
gulp_filter = require 'gulp-filter'
debug = require 'gulp-debug'

paths =
  sass: 'scss/style.scss'
  styles: 'scss/**/*.scss'
  coffee: 'coffee/**/*.coffee'
  scripts: 'coffee/**/*.coffee'
  assets: 'assets'

error = (e) -> console.log e

gulp.task 'svg2png', ->
  gulp.src "#{paths.assets}/*.svg"
    .pipe svg2png()
    .pipe gulp.dest paths.assets

gulp.task 'sass', ->
  styles_filter = gulp_filter ['**/*.scss', '**/*.css']
  sass_filter = gulp_filter ['**/*.scss']

  files = bower()
  files.push paths.sass

  gulp
    .src files
    .pipe styles_filter
    .pipe sass_filter
    .pipe sass('sourcemap=none': true).on('error', error)
    .pipe sass_filter.restore()
    .pipe minify_css()
    .pipe concat('style.css')
    .pipe prefix()
    .pipe gulp.dest(paths.assets)

gulp.task 'coffee', ->
  gulp
    .src paths.coffee
    .pipe concat('main.coffee')
    .pipe coffee()
    .pipe gulp.dest(paths.assets)

gulp.task 'concat', ['coffee'], ->
  filter = gulp_filter ['**/*.js']
  files = bower()
  files.push "#{paths.assets}/main.js"
  gulp
    .src files
    .pipe filter
    .pipe concat('main.js')
    .pipe uglify()
    .pipe gulp.dest(paths.assets)

gulp.task 'scripts', ['coffee', 'concat']

gulp.task 'serve', ->
  gulp.src './'
    .pipe webserver port: 8000, directoryListing: true

gulp.task 'watch', ->
  gulp.watch paths.scripts, ['scripts']
  gulp.watch paths.styles, ['sass']

gulp.task 'build', ['sass', 'scripts', 'svg2png']

gulp.task 'default', ['serve', 'sass', 'scripts', 'watch']
