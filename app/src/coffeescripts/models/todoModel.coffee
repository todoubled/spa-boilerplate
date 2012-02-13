# ## Data Model
class Todo extends Backbone.Model
	# #### Default content for a new Todo
	defaults: ->
		content:"todo"
		done:false

	# #### Set the new Todo's content or fall back to the default content
	initialize: ->
		@set 'content':@defaults.content if !@get 'content'

	# #### Done / Not Done
	toggle: -> 
		@save done:!@get 'done'

	# #### Remove a Todo
	clear: ->
		@destroy()
		@view.remove()


# ### Export Todo and make it requirable
module.exports = Todo
