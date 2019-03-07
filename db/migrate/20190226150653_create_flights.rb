class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.datetime :departure_time, index: true
      t.datetime :arrival_time, index: true
      t.integer :available_seats
      t.references :company, foreign_key: true
      t.references :origin, index: true, foreign_key:  {to_table: :places}
      t.references :destination, index: true, foreign_key: {to_table: :places}

      t.timestamps
    end
  end
end
