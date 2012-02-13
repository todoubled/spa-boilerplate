AppView = require 'views/appView'

#  ## Bootstrap the web client App
App =
  init: ->
    new AppView()

# ## Export the App and make it requirable as a module 
module.exports = App
