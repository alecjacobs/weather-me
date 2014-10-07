request = require 'request'
fs = require 'fs'

# better way to get this? __dirname is undefined?
currentDirectory = module.filename.match(/(^.*)\/.*?$/)[1]

# load forecastIO token
API_TOKEN = require("#{currentDirectory}/secrets.json").forecastIOToken
API_ROOT = "https://api.forecast.io/forecast"

# main function to get the weather
module.exports.getWeather = (zipCode) ->
  loadCoordinates (locations) -> 
    request(buildRequestURL(locations[zipCode]), apiRequestHandler)

# load a json file used to turn a zipcode into coordinates
loadCoordinates = (doneCallback) ->
  fs.readFile "#{currentDirectory}/zipcode-locations.json", (error, data) ->
    if error
      throw error
    else
      doneCallback(JSON.parse(data))

buildRequestURL = (weatherLocation) ->
  "#{API_ROOT}/#{API_TOKEN}/#{weatherLocation.latitude},#{weatherLocation.longitude}"

# parse the response and print out the current weather
apiRequestHandler = (error, response, body) ->
  if error
    throw error
  else
    if response.statusCode == 200
      currentWeather = JSON.parse(body).currently
      console.log "#{currentWeather.summary} - #{currentWeather.temperature}"
    else
      console.log "API returned a status code: #{response.statusCode}"  
