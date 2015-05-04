// initialize mongo
var mongo = require('./mongo')
console.log('Opening connection to local MongoDB server')
mongo.init()

// initialize app
var app = require('./app')

// start app
var port = process.env.PORT || 4000
app.listen(port)
console.log('Express app started on port ' + port)

module.exports = app
