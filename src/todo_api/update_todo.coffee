act = require "#{__dirname}/../seneca/act"
send_error = require "#{__dirname}/../helpers/send_error"

module.exports = (req, res)->
  update_opts =
    role: 'todo'
    cmd: 'update_todo'
    id: req.params.id
    changes: req.body
  act update_opts
  .catch send_error res
  .then (updated_todo)->
    res
      .status 200
      .json updated_todo
