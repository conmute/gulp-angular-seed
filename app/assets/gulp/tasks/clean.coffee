gulp = require 'gulp'
del = require 'del'

gulp.task "clean-scripts", 'deletes dist app files', (cb) ->
  del [GLOBAL.fn.getSrc 'app'], cb
  return

gulp.task "clean-spec", 'deletes dist spec files', (cb) ->
  del [GLOBAL.fn.getSrc 'spec'], cb
  return

gulp.task "clean-spec-e2e", 'deletes dist spec-e2e files', (cb) ->
  del [GLOBAL.fn.getSrc 'spec_e2e'], cb
  return

gulp.task "clean-all", 'cleans all assets from dist folder', [
  "clean-scripts"
  "clean-spec"
  "clean-spec-e2e"
], (cb) ->
  do cb
  return