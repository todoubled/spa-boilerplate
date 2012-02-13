express = require 'express'
stylus = require 'stylus'
stitch = require 'stitch'
app = express.createServer()
port = 1110

# Configure stylus to compile and serve all .styl files
cssOptions =
  debug:true
  src:"#{__dirname}/app/src/stylesheets"
  dest:"#{__dirname}/app/public"
  compile:compileMethod

# Custom compiler for stylus
compileMethod = (str, path) ->
  stylus(str)
    .set 'filename', path
    .set 'compress', true


dependencies = [
	"#{__dirname}/app/src/javascripts/jquery.js"	
	"#{__dirname}/app/src/javascripts/json2.js"
	"#{__dirname}/app/src/javascripts/underscore.js"
	"#{__dirname}/app/src/javascripts/backbone.js"
	"#{__dirname}/app/src/javascripts/backbone.localstorage.js"
]


package = stitch.createPackage paths:["#{__dirname}/app/src/coffeescripts"], dependencies:dependencies

# Configure the server with stylus and browserify middleware
app.configure () ->
  app.use app.router
  app.use stylus.middleware cssOptions
  app.get '/application.js', package.createServer()
  app.use express.static "#{__dirname}/app/public"

# Start the server
app.listen port
console.log "Express server started on port: #{port}"
