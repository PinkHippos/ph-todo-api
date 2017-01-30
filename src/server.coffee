act = require "#{__dirname}/seneca/act"
app = require "#{__dirname}/app"

port = 80

server = app.listen port, (err)->
  if err
    console.log 'Error starting API server', err
  else
    log_opts =
      role: 'util'
      cmd: 'log'
      service: 'API Server'
      message: "API Server v#{PH_API_V} started on port #{port}"
    act log_opts

module.exports = server
