Todo = require '../src/coffeescripts/models/todoModel'
Backbone = require '../node_modules/backbone/backbone'

describe 'Todo model', ->
	beforeEach ->
		console.log Backbone
		@item = new Todo()

	it 'has default content', ->
		expect(@item.get 'content').toEqual 'foo'
