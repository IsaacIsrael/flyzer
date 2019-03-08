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
      arrival_time: arrival_time,
      departure_time: departure_time
    }.to_json
  end
end
