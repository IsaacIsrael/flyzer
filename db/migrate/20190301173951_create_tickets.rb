class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :number
      t.date :date
      t.string :origin
      t.string :destiny
      t.datetime :departure_time
      t.datetime :arrival_time
      t.string :company
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
