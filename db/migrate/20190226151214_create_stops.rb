class CreateStops < ActiveRecord::Migration[5.2]
  def change
    create_table :stops do |t|
      t.integer :duration
      t.references :place, foreign_key: true
      t.references :flight, foreign_key: true

      t.timestamps
    end
  end
end
