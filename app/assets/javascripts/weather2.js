API_KEY = "YOUR API KEY"
BASE_URL = "http://api.openweathermap.org/data/2.5/forecast"

require "json"
require "open-uri"

response = open(BASE_URL + "?q=Akashi-shi,jp&APPID=#{API_KEY}")
puts JSON.pretty_generate(JSON.parse(response.read))