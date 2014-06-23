###

    LogEntryCollectionView

    author: @jeremiahhall

    created: 6/20/14 - 3:00 PM

    description:

###
$ = require 'jquery'
_ = require 'underscore'
Backbone = require '../backbone.coffee'

LogEntry = require '../models/LogEntry.coffee'
LogEntryCollection = require '../models/LogEntryCollection.coffee'

LogEntryCollectionView = Backbone.View.extend

  el: '#LogEntryCollectionView'

  template_id: '#LogEntryCollectionView-template'

  events:
    'keypress #log-entry-input': 'input'
    'click .delete-button': 'delete_entry'

  initialize: (options) ->
    @template = _.template $(@template_id).html()
    @collection = new LogEntryCollection()
    @collection.on "sync", =>
      @render()
    @collection.on "remove", =>
      @render()
    @collection.on "error", (model, e, options) ->
      console.dir model
      console.dir e
      console.dir options
    @collection.fetch()

  render: ->
    @$el.html @template entries: @collection.toJSON()

  input: (e) ->
    unless e.keyCode is 13
      return
    new_log_text = $(e.currentTarget).val()
    @collection.create text: new_log_text

  delete_entry: (e) ->
    entry_id = $(e.currentTarget).closest('.log-entry').attr 'data-target'
    to_delete = @collection.findWhere _id: entry_id
    to_delete.destroy()

module.exports = LogEntryCollectionView