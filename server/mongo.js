var mongoose = require('mongoose')

module.exports = {
  init: function() {
    // Set up the Mongoose connection to the MongoDB instance
    mongoose.connection.on(
      'error', 
      console.error.bind(console), 
      'connection error:'
    )
    
    mongoose.connection.on(
      'connected', 
      console.log.bind(console), 
      'connection successful'
    )
    
    mongoose.connect("mongodb://localhost:27017/seabourne-code-challenge")
  }
  
}

