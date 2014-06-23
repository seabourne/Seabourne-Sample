###

    LogEntryController

    author: @jeremiahhall

    created: 6/21/14 - 2:32 PM

    description:

    See Mongoose docs here: http://mongoosejs.com/docs/

###

# npm dependencies
express = require 'express'
router = express.Router()

# internal dependencies
LogEntry = require '../models/LogEntry'

router.param 'entry', (req, res, next, id) ->
  LogEntry.findOne _id: id, (err, entry) ->
    if err?
      return next err
    if !entry?
      return next(new Error('failed to load entry'))

    req.entry = entry
    next()

router.get '/', (req, res, next) ->
  LogEntry.find({})
  .sort({created_at: 1})
  .exec (err, entries) ->
    if err?
      return res.send 500, err
    if !entries?
      return res.send 500, new Error('failed to load entries')

    res.json entries

router.post '/', (req, res, next) ->
  LogEntry.create req.body, (err, newEntry) ->
    if err?
      return res.send 500, err
    if !newEntry?
      return res.send 500, new Error('failed to create entry')

    return res.json newEntry

router.delete '/:entry', (req, res, next) ->
  req.entry.remove (err, doc) ->
    if err?
      return res.send 500, err

    res.send 200

module.exports = router
