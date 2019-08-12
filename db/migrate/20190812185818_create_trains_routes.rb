# frozen_string_literal: true

class CreateTrainsRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :trains_routes do |t|
      t.integer :train_id
      t.integer :route_id
    end
  end
end
