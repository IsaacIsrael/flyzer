class Flight < ApplicationRecord
  belongs_to :company
  belongs_to :origin, class_name: 'Place'
  belongs_to :destiny, class_name: 'Place'
  has_many :stops
  monetize :price_cents

  accepts_nested_attributes_for :stops

  def route
    "#{origin.code} - #{destiny.code}"
  end
end
