#App = require '../src/coffeescripts/controllers/app'
#AppView = require '../src/coffeescripts/views/appView'

describe  'App', ->
	it 'renders an AppView', ->
		spyOn AppView, 'initialize'
		App.init()
		expect(AppView.initialize).toHaveBeenCalled()

