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
    Flight.create(AmadeusService.flight_offers(params))
  end
end
