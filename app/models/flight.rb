class Flight < ApplicationRecord
  include Filterable

  belongs_to :company
  belongs_to :origin, class_name: 'Place'
  belongs_to :destiny, class_name: 'Place'
  has_many :stops
  monetize :price_cents

  accepts_nested_attributes_for :stops

  scope :date, ->(date) { where("departure_time BETWEEN ? AND ?", date, date.end_of_day + 1.day) }
  scope :origin_city, ->(origin) { joins("JOIN places  ON places.id =  flights.origin_id").where(places: { city: origin }) }
  scope :destiny_city, ->(destiny) { joins("JOIN places d ON d.id =  flights.destiny_id").where("d.city = ?", destiny ) }

  validates :amadeus_id, uniqueness: true

  def duration
    arrival_time - departure_time
  end
end
