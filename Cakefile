{spawn, exec} = require 'child_process'
{log, error} = console; print = log
Notes = require 'notes'
fs = require 'fs'
sys = require 'sys'
colors = require 'colors'
stitch = require 'stitch'
cssmin = require 'clean-css'
jsmin = require 'uglify-js'

shell = (cmds, callback) ->
    cmds = [cmds] if Object::toString.apply(cmds) isnt '[object Array]'
    exec cmds.join(' && '), (err, stdout, stderr) ->
      print trimStdout if trimStdout = stdout.trim()
      error stderr.trim() if err
      callback() if callback

task 'notes', 'Print out notes from project', ->
  notes = new Notes "#{__dirname}/app"
  notes.annotate()



task 'docco', 'build the docs', (options) ->
  shell 'docco app/*.coffee'



task 'build', 'Compile CoffeeScript into final JS build', ->
  # TODO: investigate dependencies option with stitch
  package = stitch.createPackage paths:["#{__dirname}/app/src/javascripts"], dependencies:[]
  package.compile (err, source) ->
    fs.writeFile "#{__dirname}/app/public/javascripts/application.js", source, (err) ->
      if err then throw err

  js = [
    'javascripts/application.js'
  ]

  css = [
    'stylesheets/normalize.css'
    'stylesheets/style.css'
  ]

  fs.unlinkSync "#{__dirname}/app/public/stylesheets/application.min.css"
  fs.unlinkSync "#{__dirname}/app/public/javascripts/application.min.js"

  css.forEach (file, i) ->
    fs.readFile "app/public/#{file}", (err, buf) ->
      code = cssmin.process(buf.toString())
      ws = fs.createWriteStream("#{__dirname}/app/public/stylesheets/application.min.css", flags: 'a', encoding: 'utf-8',mode: 0666)
      ws.on 'error', (e) -> console.error e
      #ws.write code
      ws.write buf.toString()
      ws.end()

  js.forEach (file, i) ->
    fs.readFile "app/public/#{file}", (err, buf) ->
      jsp = jsmin.parser
      pro = jsmin.uglify
      ast = jsp.parse buf.toString()
      ast = pro.ast_mangle ast
      ast = pro.ast_squeeze ast
      # FIXME: Bypassing uglify's parser, causes error
      #code = pro.gen_code ast
      code = buf.toString()
      ws = fs.createWriteStream("#{__dirname}/app/public/javascripts/application.min.js", flags: 'a', encoding: 'utf-8',mode: 0666)
      ws.on 'error', (e) -> console.error e
      ws.write code
      ws.end()
