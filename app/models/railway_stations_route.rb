# frozen_string_literal: true

class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }
  # validates :position, uniqueness: { scope: :route_id }

  after_create :add_position

  # private

  # def add_position
  #   select('railway_stations').where(route_id: route_id)
  # end

  def add_position
    if route.railway_stations_routes.where(position: true).present?
      binding.pry

      max_position = route.railway_stations_routes.map(&:position).max
      update(position: max_position + 1)
    else
      binding.pry
      route.railway_stations_routes.each_with_index do |station, index|
        binding.pry
        station.update(position: index + 1)
      end
    end
  end
end
# route.railway_stations_routes.where(position: true).