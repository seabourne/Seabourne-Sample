###

    LogEntryCollection

    author: @jeremiahhall

    created: 6/20/14 - 2:59 PM

    description:

###

Backbone = require '../backbone.coffee'
LogEntry = require './LogEntry.coffee'

LogEntryCollection = Backbone.Collection.extend

  model: LogEntry

  url: "entries"

  initialize: (options) ->

module.exports = LogEntryCollection