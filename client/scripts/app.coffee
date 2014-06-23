###

    app

    author: @jeremiahhall

    created: 6/20/14 - 2:57 PM

    description:

###

Backbone = require './backbone.coffee'
LogEntryCollectionView = require './views/LogEntryCollectionView.coffee'

AppRouter = Backbone.Router.extend

  routes:
    '': 'collectionView'

  initialize: ->

  collectionView: () ->
    collection = new LogEntryCollectionView()

module.exports = AppRouter