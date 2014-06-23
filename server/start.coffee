###

    start

    author: @jeremiahhall

    created: 6/20/14 - 3:02 PM

    description:

###

# initialize mongo
mongo = require './mongo'
console.log 'Opening connection to local MongoDB server'
mongo.init()

# initialize app
app = require './app'

# start app
port = process.env.PORT || 4000
app.listen port
console.log 'Express app started on port ' + port

module.exports = app
