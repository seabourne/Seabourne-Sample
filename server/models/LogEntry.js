var mongoose = require('mongoose')

var LogEntry = new mongoose.Schema({
  text: {
    type: String
  },
  created_at: {
    type: Date
  }
})

module.exports = mongoose.model('LogEntry', LogEntry)
