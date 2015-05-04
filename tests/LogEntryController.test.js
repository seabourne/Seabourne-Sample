var should = require('should')
var supertest = require('supertest')
var _ = require('underscore')
var mongo = require('../server/mongo')
mongo.init()
var app = require('../server/app')
var api = supertest(app)

describe('Log Entry Controller -', function (done) {

  var created = null

  before(function (done) {
    created = []
    done()
  })

  describe('POST /entries -', function (done) {

    it('should store a log entry and return the result', function (done) {
      api
      .post('/entries')
      .expect('Content-Type', /json/)
      .expect(200)
      .send({text: "A new log entry"})
      .end(function (err, res) {
        should(err ? true : false).eql(false)
        should(res ? true : false).eql(true)
        should(res.body ? true : false).eql(true)
        should(res.body.text ? true : false).eql(true)
        should(res.body.text).eql("A new log entry")
        created.push(res.body)
        done()
      })
      
    })

    it('should store a log entry with the current time as created_at',
    function (done) {
      api
      .post('/entries')
      .expect('Content-Type', /json/)
      .expect(200)
      .send({text: "A new log entry"})
      .end(function (err, res) {
        should(err ? true : false).eql(false)
        should(res ? true : false).eql(true)
        should(res.body ? true : false).eql(true)
        should(res.body.text ? true : false).eql(true)
        created.push(res.body)
        should(res.body.text).eql("A new log entry")
        should(res.body.created_at ? true : false).eql(true)
        done()
      })
    })
  })
  describe('GET /entries', function (done) {

    it('returns list of entries in descending order by created_at',
    function (done) {
      api
      .get('/entries')
      .expect('Content-Type', /json/)
      .expect(200)
      .end(function (err, res) {
        should(err ? true : false).eql(false)
        should(res ? true : false).eql(true)
        // should return something
        should(res.body ? true : false).eql(true)
        // should return at least two documents
        should(res.body[1] ? true : false).eql(true)
        // should have a created_at value
        should(res.body[1].created_at ? true : false).eql(true)
        // created date for second doc should be lower than first doc
        should(res.body[1].created_at < res.body[0].created_at).eql(true)
        done()
      })
    })
  })
  describe('DELETE /LogEntry/:id', function (done) {

    it('should delete the specified log entry', function (done) {
      var to_delete = created.pop()._id
      api
      .delete('/entries/' + to_delete)
      .expect('Content-Type', /json/)
      .expect(200)
      .end(function (err, res) {
        api
        .get('/entries')
        .expect('Content-Type', /json/)
        .expect(200)
        .end(function (err, res) {
          var found = _.find(res.body, function (e) {
            return e._id === to_delete
          })
          // should no longer be found in results
          should(found ? true : false).eql(false)
          done()
        })
      })
    })
  })

  // cleanup after, deletes the remaining entry created during this test
  after(function (done) {
    api
    .delete('/entries/' + created.pop()._id)
    .expect(200)
    .end(function (err, res) {
      should(err ? true : false).eql(false)
      done()
    })
  })
})