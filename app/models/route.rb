# frozen_string_literal: true

class Route < ApplicationRecord
  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name
  # after_save :add_position

  def update_position(station, position)
    exist_station_with_position = RailwayStationsRoute.find_by(route_id: 5, position: position) #существующая станция с позицоей position
    errors.add(:base, 'Position should be existed before') || return if exist_station_with_position.nil?
    station_in_route = RailwayStationsRoute.find_by(route_id: id, railway_station_id: station.id) #станция которую нужно поменять
    exist_station_with_position.update(position: station_in_route.position) #меняем станцию которая была с этой позицией на позицию чтанции которую мы меняем
    station_in_route.update(position: position) #меняем позицию заданной станции на зажанную позицию
  end

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    errors.add(:base, 'Route should contain at least 2 stations') if railway_stations.size < 2
  end
end
