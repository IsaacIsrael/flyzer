# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#https://gist.githubusercontent.com/tdreyno/4278655/
# {
#     "code": "AAA",
#     "lat": "-17.3595",
#     "lon": "-145.494",
#     "name": "Anaa Airport",
#     "city": "Anaa",
#     "state": "Tuamotu-Gambier",
#     "country": "French Polynesia",
#     "woeid": "12512819",
#     "tz": "Pacific\/Midway",
#     "phone": "",
#     "type": "Airports",
#     "email": "",
#     "url": "",
#     "runway_length": "4921",
#     "elev": "7",
#     "icao": "NTGA",
#     "direct_flights": "2",
#     "carriers": "1"
#  }

puts "Get Places from the URL  ...."
response = Unirest.get "https://gist.githubusercontent.com/tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588/airports.json"

puts "Starting Creating the Places  ...."
Place.delete_all
Place.create(response.body.map do |airport|
  airport["city"] =  airport["tz"].split('/').last&.gsub("_"," ")
  airport.slice("code","lat", "lon", "name", "city", "state", "country")
end)

puts "Finished Creating the Places ...."

# https://github.com/BesrourMS/Airlines
# {
#   "iata": "0A",
#   "name": "Amber Air"
# }

puts "Get Company from the URL  ...."
response = Unirest.get "https://raw.githubusercontent.com/BesrourMS/Airlines/master/airlines.json"

puts "Starting Company the Places  ...."
Company.delete_all
Company.create(response.body)

puts "Finished Company the Places ...."



