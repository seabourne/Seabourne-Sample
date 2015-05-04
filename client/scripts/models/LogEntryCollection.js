var Backbone = require('../backbone.js')
var LogEntry = require('./LogEntry.js')

var LogEntryCollection = Backbone.Collection.extend({
  model: LogEntry,
  url: "entries",
  initialize: function(options) {}
})

module.exports = LogEntryCollection