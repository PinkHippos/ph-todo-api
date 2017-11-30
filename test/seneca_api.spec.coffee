{expect} = require 'chai'
_get_fresh_app_and_stub = require "#{__dirname}/_get_fresh_app_and_stub"
describe '/api/seneca', ->

  describe '/single_cmd', ->
    test_cmd =
      role: 'foo'
      cmd: 'bar'
      baz: 'bat'
    describe 'rejecting bad requests with 400 status and a message', ->
      it "rejects calls without a 'role' key", ->
        {app_in_test, act_stub} = _get_fresh_app_and_stub()
        app_in_test
          .post '/api/seneca/single_cmd'
          .send Object.assign {}, test_cmd, {role: null}
          .then (response)->
            expect(response.status).to.equal 400
            expect(response.body).to.include.keys 'message'
      it "rejects calls without a 'cmd' key", ->
        {app_in_test, act_stub} = _get_fresh_app_and_stub()
        app_in_test
          .post '/api/seneca/single_cmd'
          .send Object.assign {}, test_cmd, {cmd: null}
          .then (response)->
            expect(response.status).to.equal 400
            expect(response.body).to.include.keys 'message'
    describe 'sending back the correct status', ->
      it 'sends back a default 200 status', ->
        {app_in_test, act_stub} = _get_fresh_app_and_stub {
          stub_resolve:
            message: 'foo bar baz bat'
        }
        app_in_test
          .post '/api/seneca/single_cmd'
          .send test_cmd
          .then (response)->
            expect(response.status).to.equal 200
      it 'sends back a returned status', ->
        {app_in_test, act_stub} = _get_fresh_app_and_stub {
          stub_resolve:
            message: 'foo bar baz bat'
            status: 201
        }
        app_in_test
          .post '/api/seneca/single_cmd'
          .send test_cmd
          .then (response)->
            expect(response.status).to.equal 201
    describe 'using act properly', ->
      result = null
      act_stub = null
      stub_resolve = message: 'foo bar baz bat'
      before 'send request and save the response', ->
        {app_in_test, act_stub} = _get_fresh_app_and_stub {stub_resolve}
        app_in_test
          .post '/api/seneca/single_cmd'
          .send test_cmd
          .then (response)->
            result = response.body
      it 'calls the req.locals.act fn', ->
        expect(act_stub.called).to.equal true
      it 'calls the act fn with the body of the request', ->
        expect(act_stub.calledWith(test_cmd)).to.equal true
      it 'returns the result of the act fn', ->
        expect(result).to.deep.equal stub_resolve
