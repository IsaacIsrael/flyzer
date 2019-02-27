namespace :flights do
  desc "Poppulate the flights table"
  task :populate do
    params = {
      origin: 'NYC',
      destination: 'MAD',
      departureDate: '2019-08-01'
    }
    Flight.create(AmadeusService.flight_offers(params))
  end
end
