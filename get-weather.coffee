request = require 'request'
cheerio = require 'cheerio'

requestHandler = (error, response, body) ->
  $ = cheerio.load(body)

  currentCondition = $('#curCond .wx-value').text()
  currentTemp = $('#curTemp .wx-value').text()
  currentUnit = $('#curTemp .wx-unit').text()

  printWeather(currentCondition, currentTemp, currentUnit)

printWeather = (cond, temp, unit) ->
  weatherOutput = "#{cond} - #{temp} #{unit}"
  console.log(weatherOutput)

module.exports.getWeather = (zipCode) ->
  url = "http://www.wunderground.com/cgi-bin/findweather/getForecast?query=" + zipCode
  request(url, requestHandler)