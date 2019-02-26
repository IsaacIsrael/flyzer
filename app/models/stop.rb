class Stop < ApplicationRecord
  belongs_to :place
  belongs_to :flight
end
