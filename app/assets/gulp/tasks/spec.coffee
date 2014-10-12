gulp          = require "gulp"
http          = require "http"
jasmine       = require "gulp-jasmine"
testem        = require "gulp-testem"
notify        = require "gulp-notify"

gulp.task "spec-coverage", 'starts testem server', ->
  coverageServer = http.createServer((req, resp) ->
    req
      .pipe fs.createWriteStream "coverage.json"
    do resp.end
    return
  )
  port = 7358
  coverageServer.listen port
  notify message: "Coverage Server Started on port :" + port
  console.log "Coverage Server Started on port", port
  return

gulp.task "spec", 'runs spec files (waits for browsers be at given location)', [
  "spec-coverage"
  "scripts"
  "scripts-spec"
], ->
  src_files = []

  GLOBAL.fn.pushSrc src_files, 'app'
  GLOBAL.fn.pushSrc src_files, 'spec'

  gulp.src [""]
    .pipe testem
      framework: "jasmine"
      src_files: src_files
