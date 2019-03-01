class Flight < ApplicationRecord
  belongs_to :company
  belongs_to :origin, class_name: 'Place'
  belongs_to :destiny, class_name: 'Place'
  has_many :stops
  monetize :price_cents
  has_many :orders

  accepts_nested_attributes_for :stops

  def self.sort_flights_by_date
    order('departure_time ASC')
  end

  def bought_seats
    orders.to_a.map(&:passenger_number).inject(0, :+)
  end
end
