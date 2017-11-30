send_error = require "#{__dirname}/../helpers/send_error"

module.exports = (req, res)->
  {id} = req.params
  delete_opts =
    role: 'todo'
    cmd: 'delete_todo'
    id: id
  req.app.locals.act delete_opts
  .catch send_error res
  .then ->
    res
      .status 204
      .end()
