{assign} = require 'lodash'

act = require "#{__dirname}/act"
send_error = require "#{__dirname}/helpers/send_error"

module.exports = (req, res)->
  # Set base action opts
  get_opts =
    role: 'todo'
    cmd: 'get_todos'

  # Grab all the query keys and apply them to the action args
  get_opts = assign get_opts, req.query

  # Execute the action
  act get_opts
  .catch send_error res
  .then (todos)->
    # Send all the retrieved todos
    res
      .status 200
      .json todos
