class AddSkuToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :sku, :string
  end
end
