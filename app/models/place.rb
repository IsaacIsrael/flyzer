class Place < ApplicationRecord
  def info
    "#{code} - #{name}"
  end
end
