express = require 'express'
stylus = require 'stylus'
connect = require 'connect'
stitch = require 'stitch'
app = express.createServer()
port = 1110

# Configure stylus to compile and serve all .styl files
cssOptions =
  debug:true
  src:"#{__dirname}/src"
  dest:"#{__dirname}/public"
  compile:compileMethod

# Custom compiler for stylus
compileMethod = (str, path) ->
  stylus(str)
    .set 'filename', path
    .set 'compress', true

package = stitch.createPackage paths:["#{__dirname}/src/javascripts"], dependencies:[]

# Configure the server with stylus and browserify middleware
app.configure () ->
  app.use app.router
  app.use stylus.middleware cssOptions
  app.get '/application.js', package.createServer()
  app.use express.static "#{__dirname}/public"

# Start the server
app.listen port
console.log "Express server started on port: #{port}"
