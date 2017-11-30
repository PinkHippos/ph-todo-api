app = require "#{__dirname}/app"

port = 80

server = app.listen port, (err)->
  if err
    console.log 'Error starting API server', err
  else
    log_opts =
      role: 'util'
      cmd: 'log'
      type: 'general'
      service: 'API Server'
      message: "API Server v#{process.env.PH_API_V} started on port #{port}"
    app.locals.act log_opts

module.exports = server
