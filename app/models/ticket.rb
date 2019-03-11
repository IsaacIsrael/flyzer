class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :flight, optional: true
  belongs_to :company
  belongs_to :origin, class_name: 'Place'
  belongs_to :destination, class_name: 'Place'

  validates :number, :departure_time, :arrival_time, presence: true

  def json
    {
      id: id,
      number: number,
      origin: origin.code,
      destination: destination.code,
      arrival_time: arrival_time_UTC,
      departure_time: departure_time_UTC
    }.to_json
  end

  def arrival_time_UTC
    arrival_time + 3.hours
  end

  def departure_time_UTC
    departure_time + 3.hours
  end
end
