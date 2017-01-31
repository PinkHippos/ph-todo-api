act = require "#{__dirname}/../seneca/act"
send_error = require "#{__dirname}/../helpers/send_error"

module.exports = (req, res)->
  todo = req.body
  # {id, username} = req.auth_payload
  # todo.author = id
  add_opts =
    role: 'todo'
    cmd: 'add_todo'
    new_todo: todo
  act add_opts
  .then (new_todo)->
    res
      .status 201
      .json new_todo
  .catch send_error res
