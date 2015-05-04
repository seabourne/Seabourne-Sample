var $ = require('jquery')
var _ = require('underscore')
var Backbone = require('../backbone.js')

var LogEntry = require('../models/LogEntry.js')
var LogEntryCollection = require('../models/LogEntryCollection.js')

var LogEntryCollectionView = Backbone.View.extend({

  el: '#LogEntryCollectionView',

  template_id: '#LogEntryCollectionView-template',

  events: {
    'keypress #log-entry-input': 'input',
    'click .delete-button': 'delete_entry'  
  },

  initialize: function(options) {
    this.template = _.template($(this.template_id).html())
    this.collection = new LogEntryCollection()
    this.collection.on("sync", this.render.bind(this))
    this.collection.on("remove", this.render.bind(this))
    this.collection.on("error", function (model, e, options) {
      console.dir(model)
      console.dir(e)
      console.dir(options)
    })
    this.collection.fetch()
  },
  
  render: function() {
    this.$el.html(this.template({entries: this.collection.toJSON()}))    
  },


  input: function(e) {
    if (e.keyCode !== 13) return
    var new_log_text = $(e.currentTarget).val()
    this.collection.create({text: new_log_text})
  },

  delete_entry: function(e) {
    var entry_id = $(e.currentTarget).closest('.log-entry').attr('data-target')
    var to_delete = this.collection.findWhere({_id: entry_id})
    to_delete.destroy()
  }
  
})

module.exports = LogEntryCollectionView