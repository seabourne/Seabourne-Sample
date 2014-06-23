###

    LogEntryController.test

    author: @jeremiahhall

    created: 6/20/14 - 3:04 PM

    description:

###

should = require 'should'
supertest = require 'supertest'
_ = require 'underscore'
mongo = require '../server/mongo'
mongo.init()
app = require '../server/app'
api = supertest(app)

describe 'Log Entry Controller -', (done) ->

  before (done) ->
    @created = []
    done()

  describe 'POST /entries -', (done) ->

    it 'should store a log entry and return the result', (done) ->
      api
      .post('/entries')
      .expect('Content-Type', /json/)
      .expect(200)
      .send(text: "A new log entry")
      .end (err, res) =>
        (err?).should.be.false
        (res?).should.be.true
        (res.body?).should.be.true
        (res.body.text?).should.be.true
        (res.body.text).should.eql "A new log entry"
        @created.push res.body
        done()

    it 'should store a log entry with the current time as created_at', (done) ->
      api
      .post('/entries')
      .expect('Content-Type', /json/)
      .expect(200)
      .send(text: "A new log entry")
      .end (err, res) =>
        (err?).should.be.false
        (res?).should.be.true
        (res.body?).should.be.true
        (res.body.text?).should.be.true
        @created.push res.body
        (res.body.text).should.eql "A new log entry"
        (res.body.created_at?).should.be.true
        done()

  describe 'GET /entries', (done) ->

    it 'returns list of entries in descending order by created_at', (done) ->
      api
      .get('/entries')
      .expect('Content-Type', /json/)
      .expect(200)
      .end (err, res) ->
        (err?).should.be.false
        (res?).should.be.true
        # should return something
        (res.body?).should.be.true
        # should return at least two documents
        (res.body[1]?).should.be.true
        # should have a created_at value
        (res.body[1].created_at?).should.be.true
        # created date for second doc should be lower than first doc
        (res.body[1].created_at < res.body[0].created_at).should.be.true
        done()

  describe 'DELETE /LogEntry/:id', (done) ->

    it 'should delete the specified log entry', (done) ->
      to_delete = @created.pop()._id
      api
      .delete('/entries/' + to_delete)
      .expect('Content-Type', /json/)
      .expect(200)
      .end (err, res) =>
        api
        .get('/entries')
        .expect('Content-Type', /json/)
        .expect(200)
        .end (err, res) =>
          found = _.find res.body, (e) -> e._id is to_delete
          # should no longer be found in results
          (found?).should.be.false
          done()

  # cleanup after, deletes the remaining entry created during this test
  after (done) ->
    api
    .delete('/entries/' + @created.pop()._id)
    .expect(200)
    .end (err, res) ->
      (err?).should.be.false
      done()