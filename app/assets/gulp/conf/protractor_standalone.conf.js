// this file should be at root of our node project
// this lines fixing "unable to find jar" issue
upToRoot = '../../../../'
// Make use you check the version in the folder
fileName = 'selenium-server-standalone-2.43.1.jar';

// An example configuration file.
// https://raw.github.com/angular/protractor/master/example/conf.js
exports.config = {
  // The address of a running selenium server.
  seleniumServerJar: './' + upToRoot + 'node_modules/protractor/selenium/' + fileName,
  // Capabilities to be passed to the webdriver instance.
  capabilities: {
    'browserName': 'chrome'
  },

  // Options to be passed to Jasmine-node.
  jasmineNodeOpts: {
    showColors: true,
    defaultTimeoutInterval: 30000,
    includeStackTrace: false
  }
};