###

    LogEntry

    author: @jeremiahhall

    created: 6/20/14 - 2:59 PM

    description:

###

Backbone = require '../backbone.coffee'

LogEntry = Backbone.Model.extend

  idAttribute: "_id"

  urlRoot: "entries"

  initialize:  ->

module.exports = LogEntry
