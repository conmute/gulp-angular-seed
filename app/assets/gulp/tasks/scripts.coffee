gulp          = require 'gulp'
gulpif        = require "gulp-if"
concat        = require "gulp-concat"
notify        = require "gulp-notify"
coffee        = require "gulp-coffee"
coffeelint    = require "gulp-coffeelint"
coffeeConfig  = bare: true

gulp.task "scripts", 'compile application scripts', ["clean-scripts"], ->
  gulp.src [
    GLOBAL.srcPath.app + "**/*.js"
    GLOBAL.srcPath.app + "**/*.coffee"
  ]
    .pipe gulpif /[.]coffee$/, coffeelint()
    .pipe coffeelint.reporter "fail"
    .pipe gulpif /[.]coffee$/, coffee coffeeConfig

    .pipe gulpif !GLOBAL.seperateDist.app, concat GLOBAL.fileName.app

    .pipe gulp.dest GLOBAL.distPath.app
    .pipe notify message: "Application scripts task complete"

gulp.task "scripts-spec", 'compile test scripts', ["clean-spec"], ->
  gulp.src [
    GLOBAL.srcPath.spec + "**/*.js"
    GLOBAL.srcPath.spec + "**/*.coffee"
  ]
    .pipe gulpif /[.]coffee$/, coffeelint()
    .pipe coffeelint.reporter "fail"
    .pipe gulpif /[.]coffee$/, coffee coffeeConfig

    .pipe gulpif !GLOBAL.seperateDist.spec, concat GLOBAL.fileName.spec

    .pipe gulp.dest GLOBAL.distPath.spec
    .pipe notify message: "Test scripts task complete (low fidelity)"

gulp.task "scripts-spec-e2e", 'compile scripts for end to end testing', [
  "clean-spec-e2e"
], ->
  gulp.src [
    GLOBAL.srcPath.spec_e2e + "**/*.js"
    GLOBAL.srcPath.spec_e2e + "**/*.coffee"
  ]
    .pipe gulpif /[.]coffee$/, coffeelint()
    # .pipe coffeelint.reporter "fail"
    .pipe gulpif /[.]coffee$/, coffee coffeeConfig

    .pipe gulpif !GLOBAL.seperateDist.spec_e2e, concat GLOBAL.fileName.spec_e2e

    .pipe gulp.dest GLOBAL.distPath.spec_e2e
    .pipe notify message: "Test scripts task complete (hight fidelity)"
