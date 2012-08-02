fs = require 'fs'
stitch = require 'stitch'
jsmin = require 'uglify-js'

# These dependencies must match up with those in server.coffee
dependencies = [
  "#{__dirname}/app/src/javascripts/jquery.js"
  "#{__dirname}/app/src/javascripts/json2.js"
  "#{__dirname}/app/src/javascripts/underscore.js"
  "#{__dirname}/app/src/javascripts/backbone.js"
  "#{__dirname}/app/src/javascripts/backbone.localstorage.js"
]

package = stitch.createPackage paths:["#{__dirname}/app/src/coffeescripts"], dependencies:dependencies
package.compile (err, source) ->
  jsp = jsmin.parser
  pro = jsmin.uglify
  ast = jsp.parse source.toString()
  ast = pro.ast_mangle ast
  ast = pro.ast_squeeze ast
  code = pro.gen_code ast

  fs.writeFile "#{__dirname}/app/public/application.js", code, (err) ->
    if err then throw err
