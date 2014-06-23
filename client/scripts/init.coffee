###

    init

    author: @jeremiahhall

    created: 6/20/14 - 2:57 PM

    description:

###
$ = require 'jquery'
Backbone = require './backbone.coffee'
AppRouter = require './app.coffee'

$(document).ready ->
  AppRouter = new AppRouter()
  Backbone.history.start()