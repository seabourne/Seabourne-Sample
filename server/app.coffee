###

    app

    author: @jeremiahhall

    created: 6/20/14 - 3:02 PM

    description:

###

# npm dependencies
express = require 'express'
bodyparser = require 'body-parser'

# internal dependencies
router = require './router'

# initialize app
app = express()

# middleware
app.use bodyparser.json()
app.use (req, res, next) ->
  if res.statusCode?
    console.log "#{req.method} - #{req.url} - #{res.statusCode}"
  next()

# routes
app.use router

# serve client static files
app.use express.static __dirname + '/../_public'

console.dir __dirname + '/../_public'

module.exports = app