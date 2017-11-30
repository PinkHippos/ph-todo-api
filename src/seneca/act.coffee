seneca = require "#{__dirname}/instance"
client = seneca.client {
  type: 'amqp'
  pin: 'role:*,cmd:*'
}
module.exports = (actionOpts)->
  new Promise (resolve, reject)->
    client.act actionOpts, (err, response)->
      if err or response.err
        reject {
          seneca_err: err
          action_err: response.err
        }
      else
        resolve response.data
