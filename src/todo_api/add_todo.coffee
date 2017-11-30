send_error = require "#{__dirname}/../helpers/send_error"

module.exports = (req, res)->
  todo = req.body
  if !todo.text or typeof(todo.text) != 'string'
    res
      .status 400
      .json message: 'Please send a body with a todo that has a string text key'
  else
    add_opts =
      role: 'todo'
      cmd: 'add_todo'
      new_todo: todo
    req.app.locals.act add_opts
    .then (new_todo)->
      res
        .status 201
        .json new_todo
    .catch send_error res
