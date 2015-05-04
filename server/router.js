// npm dependencies
var express = require('express')
var router = express.Router()

// internal dependencies
var LogEntryController = require('./controllers/LogEntryController')

router.use('/entries', LogEntryController)

module.exports = router