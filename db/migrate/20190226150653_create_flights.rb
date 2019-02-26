class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :number
      t.date :departure_time, index: true
      t.date :arrival_time, index: true
      t.integer :available_seats
      t.references :company, foreign_key: true
      t.references :origin, index: true, foreign_key:  {to_table: :places}
      t.references :destiny, index: true, foreign_key: {to_table: :places}

      t.timestamps
    end
  end
end