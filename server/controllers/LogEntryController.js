// See Mongoose docs here: http://mongoosejs.com/docs/

// npm dependencies
var express = require('express')
var router = express.Router()

// internal dependencies
var LogEntry = require('../models/LogEntry')

router.param('entry', function(req, res, next, id) {
  LogEntry.findById(id, function(err, entry) {
    if(err) return next(err)
    if (!entry) return next(new Error('failed to load entry'))
    req.entry = entry
    next()
  })
})

router.get('/', function(req, res, next) {
  LogEntry.find({})
  .sort({created_at: 1})
  .exec(function(err, entries) {
    if(err)
      return res.send(500, err)
    if(!entries)
      return res.send(500, new Error('failed to load entries'))

    res.json(entries)
  })
})

router.post('/', function(req, res, next) {
  LogEntry.create(req.body, function(err, newEntry) {
    if(err) return res.send(500, err)
    if (!newEntry) return res.send(500, new Error('failed to create entry'))

    return res.json(newEntry)
  })
})

router.delete('/:entry', function(req, res, next) {
  req.entry.remove(function(err, doc) {
    if (err) return res.send(500, err)

    res.send(200)
  })
})

module.exports = router
