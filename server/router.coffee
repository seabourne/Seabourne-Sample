###

    router

    author: @jeremiahhall

    created: 6/20/14 - 3:02 PM

    description:

###

# npm dependencies
express = require 'express'
router = express.Router()

# internal dependencies
LogEntryController = require './controllers/LogEntryController'

router.use '/entries', LogEntryController

module.exports = router