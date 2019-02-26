class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :code
      t.string :lat
      t.string :lon
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
