act = require "#{__dirname}/act"
send_error = require "#{__dirname}/helpers/send_error"

module.exports = (req, res)->
  update_opts =
    role: 'todo'
    cmd: 'get_todos'
    id: req.params.id
  act update_opts
  .catch send_error res
  .then (updated_todo)->
    res
      .status 200
      .json updated_todo
