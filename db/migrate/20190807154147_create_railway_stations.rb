# frozen_string_literal: true

class CreateRailwayStations < ActiveRecord::Migration[5.2]
  def change
    create_table :railway_stations do |t|
      t.string :title

      t.timestamps
    end
  end
end
