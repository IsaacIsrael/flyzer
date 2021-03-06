class Flight < ApplicationRecord
  include Filterable

  belongs_to :company
  belongs_to :origin, class_name: 'Place'
  belongs_to :destination, class_name: 'Place'
  has_many :stops
  monetize :price_cents
  has_many :orders

  accepts_nested_attributes_for :stops

  scope :date, ->(date) { where("departure_time BETWEEN ? AND ?", date, date.end_of_day + 1.day) }
  scope :origin_city, ->(origin) { joins("JOIN places  ON places.id =  flights.origin_id").where(places: { city: origin }) }
  scope :destination_city, ->(destination) { joins("JOIN places d ON d.id =  flights.destination_id").where("d.city = ?", destination ) }
  scope :origin_name, ->(origin) { joins("JOIN places  ON places.id =  flights.origin_id").where(places: { name: origin }) }
  scope :destination_name, ->(destination) { joins("JOIN places d ON d.id =  flights.destination_id").where("d.name = ?", destination ) }

  validates :sku, uniqueness: true

  after_validation :set_convenience

  def set_convenience
    duration_component = 1_000 * (arrival_time - departure_time)**2
    price_component = price_cents**2
    stops_component = 600_000 * stops.count**2

    self.convenience = Math.sqrt(duration_component + price_component + stops_component)
  end
end
