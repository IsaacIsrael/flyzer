class AddSeatToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :seat, :integer
  end
end
