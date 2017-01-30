seneca = require 'seneca'
options =
  internal:
    logger: require 'seneca-legacy-logger'
  tag: 'api'
  log:
    level: 'error'
  debug:
    short_logs: true
seneca = seneca options
  .use 'seneca-amqp-transport', {
    amqp:
      url: 'amqp://guest:guest@rabbitmq:5672'
  }
module.exports = seneca
