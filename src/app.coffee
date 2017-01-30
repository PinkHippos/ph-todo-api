express = require 'express'
helmet = require 'helmet'
morgan = require 'morgan'

# Instantiate the app
api_app = express()

# Protect ourselves in the laziest most generic way
api_app.use helmet()

# Log out all the requests to the server
api_app.use morgan 'dev'

# Set the routes using the express.Router() instances
# exported by each *_api/index.coffee file
api_app.use '/api/todos', require "#{__dirname}/todo_api"

# Eventually add logic for token checks here

module.exports = api_app
