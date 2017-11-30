express = require 'express'
body_parser = require 'body-parser'
helmet = require 'helmet'
morgan = require 'morgan'
act = require './seneca/act'
# Instantiate the app
api_app = express()

# Add seneca act fn as a local variable
# Doing it here makes it easier to stub out later
api_app.locals.act = act

# Protect ourselves in the laziest most generic way
api_app.use helmet()

# Log out all the requests to the server
# api_app.use morgan 'dev'

# Parse the requests
api_app.use body_parser.json()

# Set the routes using the express.Router() instances
# exported by each *_api/index.coffee file
api_app.use '/api/todos', require "#{__dirname}/todo_api"
api_app.use '/api/seneca', require "#{__dirname}/seneca_api"
# Eventually add logic for token checks here

module.exports = api_app
