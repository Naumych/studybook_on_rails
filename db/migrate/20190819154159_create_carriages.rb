class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.string :type
      t.integer :number
      t.integer :top_seats
      t.integer :bottom_seats
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.integer :seats
      t.belongs_to :train
      t.integer :number_in_train

      t.timestamps null: false
    end
  end
end
