class AddPriceToFlights < ActiveRecord::Migration[5.2]
  def change
    add_monetize :flights, :price, currency: { present: false }
  end
end
