{expect} = require 'chai'
_get_fresh_app_and_stub = require "#{__dirname}/_get_fresh_app_and_stub"

describe '/api/todos', ->
  describe 'POST /', ->
    describe 'rejecting bad calls', ->
      it 'rejects todos without a text key with a 400 and a message', ->
        {act_stub, app_in_test} = _get_fresh_app_and_stub()
        app_in_test
          .post '/api/todos'
          .send {foo: 'bar'}
          .then (response)->
            expect(response).to.include.keys 'error'
            expect(response.status).to.equal 400
            expect(response.body).to.include.keys 'message'
      it 'rejects calls without a string text key', ->
        {act_stub, app_in_test} = _get_fresh_app_and_stub()
        app_in_test
          .post '/api/todos'
          .send {text: 10}
          .then (response)->
            expect(response).to.include.keys 'error'
            expect(response.status).to.equal 400
            expect(response.body).to.include.keys 'message'
