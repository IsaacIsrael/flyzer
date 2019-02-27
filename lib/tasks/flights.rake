namespace :flights do
  desc "Poppulate the flights table"
  task :populate => :environment do
    params = {
      origin: 'JFK',
      destination: 'GRU',
      departureDate: '2019-08-01',
      currency: 'BRL'
    }
    puts "Create the Flights"
    Flight.create(AmadeusService.flight_offers(params))
    puts "Finish creating the flights"
  end
end
