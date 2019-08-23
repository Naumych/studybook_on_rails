# frozen_string_literal: true

class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes, dependent: :destroy
  has_many :tickets

  def position(route)
    RailwayStationsRoute.find_by(route_id: route.id, railway_station_id: id).position
  end
end
