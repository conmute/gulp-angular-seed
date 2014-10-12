gulp       = require("gulp")
notify     = require("gulp-notify")

# The protractor task
protractor = require("gulp-protractor").protractor

# Start a standalone server
webdriver_standalone = require("gulp-protractor").webdriver_standalone

# Download and update the selenium driver
webdriver_update = require("gulp-protractor").webdriver_update

# Downloads the selenium webdriver
gulp.task "webdriver_update", 'updates selenium driver', webdriver_update

# Start the standalone selenium server
gulp.task "spec-e2e:server", 'runs webdriver server', webdriver_standalone

gulp.task "spec-e2e:run", 'starts webserver and launches tests faster', [
  "scripts-spec-e2e"
], (cb) ->

  goPtorGo = ->
    gulp.src [GLOBAL.fn.getSrc 'spec_e2e']
      .pipe protractor
        configFile: GLOBAL.srcPath.conf + "protractor_" + mode + ".conf.js"
      .on "error", (e) ->
          console.log e
          return
      .on "end", cb
    return

  mode = "standalone"

  ptorConf = require './../conf/protractor_address.conf.js'
  request = require 'request'
  request ptorConf.config.seleniumAddress, (error, response, body) ->

    if not error and response.statusCode is 200
      mode = "address"
      notify message: "webdriver is running, we will use standalone selenium"
    else
      notify message: "webdriver isn't running, goin to create selenium session"

    do goPtorGo

    return


  return

# Setting up the test task
gulp.task "spec-e2e", 'starts webserver and launches tests', [
  "webdriver_update"
  "scripts"
  "spec-e2e:run"
]