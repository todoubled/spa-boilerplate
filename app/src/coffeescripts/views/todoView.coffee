# ## The View for a Todo Item
class TodoView extends Backbone.View
	# #### @el will be created with this tag type
	tagName:'li'

	# #### The script block template in the HTML
	template: _.template $('#item-template').html()


	# #### Event Listeners
	# * remove Todo item on click of (x) image
	# * toggle done status on click of check box
	# * edit Todo item on double click of item
	# * update edited Todo item on <enter> key press
	events:
		"click .todo-destroy":"clear"
		"click .check":"toggleDone"
		"dblclick .todo-content":"edit"
		"keypress .todo-input":"updateOnEnter"


	initialize: ->
		@model.bind 'change', @render
		@model.view = @


	# #### Render the Todo item view with the model data
	# Return @ to make @render chainable
	render: =>
		$(@el).html @template @model.toJSON()
		@setContent()
		@
		

	# #### Set the Todo item template with data
	setContent: ->
		content = @model.get 'content'
		$(@el).find('.todo-content').text content
		@input = $(@el).find('.todo-input')
		@input.bind 'blur', @close
		@input.val content


	# #### Done / Not Done
	toggleDone: -> 
		@model.toggle()


	# #### Reveal the edit input and place focus on it
	edit: =>
		$(@el).addClass 'editing'
		@input.focus()


	# #### Save the updated Todo item model
	close: =>
		@model.save content:@input.val()
		$(@el).removeClass 'editing'


	# #### Update the Todo item on <enter> key press
	updateOnEnter: (e) =>
		@close if e.keyCode is 13


	# #### Remove a Todo item from the view
	remove: ->
		$(@el).remove()


	clear: ->
		@model.clear()


module.exports = TodoView
