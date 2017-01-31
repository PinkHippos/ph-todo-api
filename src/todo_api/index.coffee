express = require 'express'
todo_routes = express.Router()

# To be prefixed by /api/todos
todo_routes.route '/'
    .post require "#{__dirname}/add_todo"
    .get require "#{__dirname}/get_todos"
    
todo_routes.route '/:id'
    .patch require "#{__dirname}/update_todo"
    .delete require "#{__dirname}/delete_todo"

module.exports = todo_routes
