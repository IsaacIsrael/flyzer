class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :flights, optional: true
  belongs_to :company
  belongs_to :origin, class_name: 'Place'
  belongs_to :destination, class_name: 'Place'

  validates :number, :departure_time, :arrival_time, presence: true
end
