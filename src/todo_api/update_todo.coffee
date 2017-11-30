send_error = require "#{__dirname}/../helpers/send_error"

module.exports = (req, res)->
  update_opts =
    role: 'todo'
    cmd: 'update_todo'
    id: req.params.id
    changes: req.body
  req.app.locals.act update_opts
  .catch send_error res
  .then (updated_todo)->
    res
      .status 200
      .json updated_todo
