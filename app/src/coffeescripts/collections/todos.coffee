Todo = require 'models/todoModel'

# ### Todos Collection
class TodoList extends Backbone.Collection
	model:Todo

	# #### Store the list in localStorage
	localStorage: new Store 'todos'
	
	getDone: (todo) ->
		todo.get 'done'

	done: ->
		@filter @getDone
 
	remaining: ->
		@without.apply this, @done()

	nextOrder: ->
		return 1 if !@length 
		return @last().get('order') + 1

	comparator: (todo) -> 
		todo.get 'order'

Todos = new TodoList
module.exports = Todos
