class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :number
      t.datetime :departure_time
      t.datetime :arrival_time
      t.references :origin, foreign_key:  {to_table: :places}
      t.references :destination, foreign_key: {to_table: :places}
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true
      t.references :flight,  foreign_key: true


      t.timestamps
    end
  end
end
