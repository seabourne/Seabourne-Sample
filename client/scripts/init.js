var $ = require('jquery')
var Backbone = require('./backbone.js')
var AppRouter = require('./app.js')

$(document).ready(function() {
  new AppRouter()
  Backbone.history.start()
})