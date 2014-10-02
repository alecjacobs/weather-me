request = require 'request'
cheerio = require 'cheerio'

requestHandler = (error, response, body) ->
  $ = cheerio.load(body)

  currentCondition = $('#curCond .wx-value').text()
  currentTemp = $('#curTemp .wx-value').text()
  currentUnit = $('#curTemp .wx-unit').text()

  weatherOutput = "#{currentCondition} - #{currentTemp} #{currentUnit}"

  console.log(weatherOutput)

getWeather = (zipCode) ->
  url = "http://www.wunderground.com/cgi-bin/findweather/getForecast?query=" + zipCode
  request(url, requestHandler)

zipCode = process.argv[2] || "10012"
getWeather(zipCode)