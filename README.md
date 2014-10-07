weather-me
===

A coffee script app to get the weather. The location can be passed in as an argument (US zip code). If no argument is given, a default location is used.

usage:
---
1. register at [developer.forecast.io](https://developer.forecast.io/)
2. copy your secret token
3. create a `secrets.json` file in the directory that looks like this:

	`{ "forecastIOToken" : "[PASTE YOUR FORECAST TOKEN HERE]" }`
	
4. good to go... `coffee run.coffee [YOUR ZIPCODE]`

example...
---

`coffee run.coffee 75230`  

possible results:

- Clear - 83.1 °F
- Partly Cloudy - 82.4 °F
- Overcast - 60.4 °F
