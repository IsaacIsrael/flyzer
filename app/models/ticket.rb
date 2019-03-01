class Ticket < ApplicationRecord
  belongs_to :user
  has_one :company, through: :flight

  accepts_nested_attributes_for :company
end
