module.exports = (req, res)->
  {role, cmd} = req.body
  if !role or !cmd
    res
      .status 400
      .json message: 'Please include a role and cmd key'
  else
    req.app.locals.act req.body
      .then (response)->
        res
          .status response.status or 200
          .send response
      .catch (err)->
        console.log 'ERROR', err
        res
          .status err.status or 500
          .json err
