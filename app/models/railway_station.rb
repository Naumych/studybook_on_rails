# frozen_string_literal: true

class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes, dependent: :destroy
  has_many :tickets

  scope :ordered, -> { select('railway_stations.*, railway_stations_routes.position').joins(:railway_stations_routes).order('railway_stations_routes.position').uniq }

  def position(route)
    RailwayStationsRoute.find_by(route_id: route.id, railway_station_id: id).position
  end
end
