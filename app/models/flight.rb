class Flight < ApplicationRecord
  belongs_to :company
  belongs_to :place
  belongs_to :place
end
