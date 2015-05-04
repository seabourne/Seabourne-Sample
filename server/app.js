// npm dependencies
var express = require('express')
var bodyparser = require('body-parser')

// internal dependencies
var router = require('./router')

// initialize app
var app = express()

// middleware
app.use(bodyparser.json())
app.use(function(req, res, next) {
  if(res.statusCode) {
    console.log(req.method + " - " + req.url + " - " + res.statusCode)
  }
  next()
})

// routes
app.use(router)

// serve client static files
app.use(express.static(__dirname + '/../_public'))

module.exports = app