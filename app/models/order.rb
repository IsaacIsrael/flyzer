class Order < ApplicationRecord
  belongs_to :user
  monetize :amount_cents

  after_update :create_ticket

  private

  def create_ticket
    flight = Flight.find_by(sku: flight_sku)
    Ticket.create(number: flight.sku,
                  departure_time: flight.departure_time,
                  arrival_time:flight.arrival_time,
                  destination: flight.destination,
                  origin: flight.origin,
                  company: flight.company,
                  user: user,
                  flight: flight)
  end
end
