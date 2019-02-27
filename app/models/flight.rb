class Flight < ApplicationRecord
  belongs_to :company
  belongs_to :origin, class_name: 'Place'
  belongs_to :destiny, class_name: 'Place'
  has_many :stops

  accepts_nested_attributes_for :stops

  def self.sort_flights_by_date
    order('departure_time ASC')
  end
end
