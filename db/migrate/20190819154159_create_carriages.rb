class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.string :type
      t.integer :number
      t.integer :top_seats, default: 0
      t.integer :bottom_seats, default: 0
      t.integer :side_top_seats, default: 0
      t.integer :side_bottom_seats, default: 0
      t.integer :seats, default: 0
      t.belongs_to :train
      t.integer :number_in_train

      t.timestamps null: false
    end
  end
end
