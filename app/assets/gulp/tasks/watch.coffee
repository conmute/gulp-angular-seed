gulp          = require "gulp"

# Watch
gulp.task "watch", ->

  gulp.watch [GLOBAL.srcPath.app + '*.js', GLOBAL.srcPath.app + '*.coffee'], ["scripts"]
  gulp.watch [GLOBAL.srcPath.spec + '*.js', GLOBAL.srcPath.spec + '*.coffee'], ["scripts-spec"]
  # # for start we will rerun tests manually
  # gulp.watch [GLOBAL.srcPath.spec_e2e + '*.js', GLOBAL.srcPath.spec_e2e + '*.coffee'], ["spec-e2e:run"]

  return
