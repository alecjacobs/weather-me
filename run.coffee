DEFAULT_LOCATION = "10012"
argumentLocation = process.argv[2]

weather = require './get-weather.coffee'

weather.getWeather(argumentLocation || DEFAULT_LOCATION)
