Todos = require 'collections/todos'
TodoView = require 'views/todoView'

# ## The Main Layout
AppView = Backbone.View.extend
	el:$('#todoapp')

	statsTemplate: _.template $('#stats-template').html()

	# #### Event Listeners
	# * <enter> key press creation
	# * keyup tooltip
	# * clear link click
	events:
		"keypress #new-todo":"createItem"
		"keyup #new-todo":"showToolTip"
		"click .todo-clear a":"clearCompleted"


	# #### Cache the input, attach methods to collection events, and fetch the data
	initialize: ->
		@input = $(@el).find('#new-todo')
		_.bindAll this, 'render'

		Todos.bind 'add', @addOne
		Todos.bind 'reset', @addAll
		Todos.bind 'all', @render
		Todos.fetch()


	# #### Curate the collection data and render it in the view
	render: ->
		data =
			total:Todos.length
			done:Todos.done().length
			remaining:Todos.remaining().length

		$('.todo-stats').html @statsTemplate data


	# #### Render a new Todo in the view
	addOne: (todo) =>
		view = new TodoView model:todo
		$('#todo-list').append view.render().el

	# #### Render the entire collection in the view
	addAll: =>
		_.each Todos, @addOne


	# #### Assemble the data for a new Todo
	newAttributes: ->
		attributes =
			content:@input.val()
			done:false


	# #### Create a new Todo on <enter> keypress
	createItem: (e) ->
		return if e.keyCode != 13
		Todos.create @newAttributes()
		@input.val ''


	# #### Remove all of the completed todos
	clearCompleted: ->
		_.each Todos.done(), (todo) ->
			todo.clear()
		false


	# #### Show the tooltip with a slight delay
	showToolTip: (e) ->
		tooltip = $('.ui-tooltip-top')
		val = @input.val()
		tooltip.fadeOut()
		clearTimeout @tooltipTimeout if @tooltipTimeout
		return if val is '' or val is @input.attr 'placeholder'
		show = -> tooltip.show().fadeIn()
		@tooltipTimeout = _.delay show, 1000


# ### Export AppView as a module
module.exports = AppView
