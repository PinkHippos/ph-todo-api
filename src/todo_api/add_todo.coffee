act = require "#{__dirname}/../seneca/act"
send_error = require "#{__dirname}/../helpers/send_error"

module.exports = (req, res)->
  {todo} = req.body
  # {id, username} = req.auth_payload
  # todo.author = id
  add_opts =
    role: 'todo'
    cmd: 'add_todo'
    new_todo: todo
  act add_opts
  .catch send_error res
  .then (new_todo)->
    # log_opts =
    #   role: 'util'
    #   cmd: 'log'
    #   service: 'todo_api'
    #   message: "New todo added for #{username}."
    # act log_opts
    res
      .status 201
      .json new_todo
