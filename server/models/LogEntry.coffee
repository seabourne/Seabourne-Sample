###

    LogEntry

    author: @jeremiahhall

    created: 6/20/14 - 3:03 PM

    description:

###

mongoose = require 'mongoose'

LogEntry = new mongoose.Schema
  text:
    type: String
  created_at:
    type: Date

module.exports = mongoose.model 'LogEntry', LogEntry
