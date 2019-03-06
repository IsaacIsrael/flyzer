class Ticket < ApplicationRecord
  belongs_to :user

  validates :number, :origin, :destiny, :departure_time, :arrival_time, :company, presence: true
end
