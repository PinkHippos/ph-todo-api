sinon = require 'sinon'
proxyquire = require('proxyquire').noCallThru()
supertest = require 'supertest'
# Gets a fresh sinon stub
# Sets the behavior of the stub if any is passed
# favors stub_return -> _resolve -> _reject
# Gets a fresh express app with the stub proxied as act function
# Wraps the express app with supertest for easy testing
module.exports = (stub_response = {})->
  {stub_return, stub_resolve, stub_reject} = stub_response
  act_stub = sinon.stub()
  if stub_return
    act_stub.returns stub_return
  else if stub_resolve
    act_stub.returns Promise.resolve stub_resolve
  else if stub_reject
    act_stub.returns Promise.reject stub_reject
  app = proxyquire "#{__dirname}/../src/app", {
    "./seneca/act": act_stub
  }
  app_in_test = supertest app
  {act_stub, app_in_test}
