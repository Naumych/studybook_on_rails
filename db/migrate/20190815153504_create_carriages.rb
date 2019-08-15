class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.timestamps
      t.string :carriage_type
      t.integer :top_seats_count
      t.integer :lower_seats_count
    end
  end
end
