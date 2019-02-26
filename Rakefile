# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :my do
  desc "Poppulate the flights table"
  task :flights do
    params = {
      origin: 'NYC',
      destination: 'MAD',
      departureDate: '2019-08-01'
    }
    response = AmadeusService.flight_offers(params)
    item = response["data"][0]

    teste = AmadeusService.build_response_flight_offers(item)
    p teste
    p Flight.create(teste)


    # stops[1..-1].each_with_index do |stop, index|
    #   arrivel_time = Time.parse(stops[index]["flightSegment"]["arrival"]["at"])
    #   departure_time = Time.parse(stop["flightSegment"]["departure"]["at"])

    #   Stop.create(
    #     duration: (departure_time - arrivel_time).ceil,
    #     place: Place.find { |destiny| destiny.code == stop["flightSegment"]["departure"]["iataCode"] },
    #     flight: f
    #   )
    # end
  end
end
