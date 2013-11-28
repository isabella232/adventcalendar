http = require 'http'
express = require 'express'
mustacheExpress = require 'mustache-express'
AdventCalendar = require './advent_calendar'
app = express()

app.set 'views', __dirname + '/../views'
app.engine 'mustache', mustacheExpress()
app.use "/assets", express.static(__dirname + '/../assets')

app.get '/', (req, res) ->
  calendar = new AdventCalendar()
  res.render 'index.mustache', calendar.calendar_data()

module.exports = app;
