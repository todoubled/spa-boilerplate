{spawn, exec} = require 'child_process'
{log, error} = console; print = log
Notes = require 'notes'
fs = require 'fs'
colors = require 'colors'
stitch = require 'stitch'
jsmin = require 'uglify-js'
Browser = require 'zombie'
assert = require 'assert'

shell = (cmds, callback) ->
    cmds = [cmds] if Object::toString.apply(cmds) isnt '[object Array]'
    exec cmds.join(' && '), (err, stdout, stderr) ->
      print trimStdout if trimStdout = stdout.trim()
      error stderr.trim() if err
      callback() if callback


task 'start', 'start the dev server', ->
  confirm = "Development Server started"
  shell 'node_modules/supervisor/lib/cli-wrapper.js server.coffee'
  console.log "#{confirm.green}"


task 'docs', 'build the docs', ->
  confirm = "Documentation built: "
  process.chdir "#{__dirname}/app"
  shell '../node_modules/docco/bin/docco src/coffeescripts/collections/*.coffee' 
  console.log "#{confirm.green} collections"
  shell '../node_modules/docco/bin/docco src/coffeescripts/controllers/*.coffee' 
  console.log "#{confirm.green} controllers"
  shell '../node_modules/docco/bin/docco src/coffeescripts/models/*.coffee' 
  console.log "#{confirm.green} models"
  shell '../node_modules/docco/bin/docco src/coffeescripts/views/*.coffee' 
  console.log "#{confirm.green} views"
  process.chdir "#{__dirname}"


task 'test', 'run Jasmine specs', ->
  shell 'node_modules/jasmine-node/bin/jasmine-node --color --coffee app/spec/'


task 'lint', 'run CoffeeScripts through the linter', ->
  shell 'node_modules/coffeelint/bin/coffeelint -f linter.json app/src/coffeescripts/controllers/*'
  shell 'node_modules/coffeelint/bin/coffeelint -f linter.json app/src/coffeescripts/collections/*'
  shell 'node_modules/coffeelint/bin/coffeelint -f linter.json app/src/coffeescripts/models/*'
  shell 'node_modules/coffeelint/bin/coffeelint -f linter.json app/src/coffeescripts/views/*'


task 'notes', 'Print out notes from project', ->
  notes = new Notes "#{__dirname}/app/src/coffeescripts"
  notes.annotate()


task 'build', 'Compile CoffeeScript into final JS build', ->
  confirm = "Compiled all scripts into application.js"
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
      console.log "#{confirm.green}"


task 'browse', 'Headlessly browse the app with zombie', ->
  browser = new Browser()
  browser.visit 'http://localhost:1110', (e, brs, status) ->
    console.log brs.body
