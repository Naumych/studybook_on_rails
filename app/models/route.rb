# frozen_string_literal: true

class Route < ActiveRecord::Base
  validates :name, presence: true

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains_routes
  has_many :trains, through: :trains_routes
end
