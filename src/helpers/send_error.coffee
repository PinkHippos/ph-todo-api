act = require "#{__dirname}/../seneca/act"
module.exports = (res)->
  (err)->
    res
      .status err.status or 500
      .send err
