var Backbone = require('./backbone.js')
var LogEntryCollectionView = require('./views/LogEntryCollectionView.js')

var AppRouter = Backbone.Router.extend({
  routes: {
    '': 'collectionView'
  },

  initialize: function() {},

  collectionView: function() {
    this.collection = new LogEntryCollectionView()
  }
})

module.exports = AppRouter