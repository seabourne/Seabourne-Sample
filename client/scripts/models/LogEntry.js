var Backbone = require('../backbone.js')

var LogEntry = Backbone.Model.extend({
  idAttribute: "_id",
  urlRoot: "entries",
  initialize:  function() {}
})

module.exports = LogEntry