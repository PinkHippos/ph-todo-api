express = require 'express'
seneca_router = express.Router()
seneca_router.post '/single_cmd', require "#{__dirname}/single_cmd"
module.exports = seneca_router
