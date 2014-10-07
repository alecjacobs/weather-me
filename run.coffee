weather = require './get-weather'

DEFAULT_LOCATION = "10012"
inputLocation = process.argv[2]

weather.getWeather(inputLocation || DEFAULT_LOCATION)
