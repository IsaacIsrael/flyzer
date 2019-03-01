class AddConvenienceToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :convenience, :float
  end
end
