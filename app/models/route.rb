# frozen_string_literal: true

class Route < ApplicationRecord
  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name
  # after_save :add_position

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    errors.add(:base, 'Route should contain at least 2 stations') if railway_stations.size < 2
  end

  # def add_position
  #   railway_stations = RailwayStationsRoute.where(route_id: id, position: true)
  #   railway_stations_2 = RailwayStationsRoute.where(route_id: id, position: nil)
  #   railway_stations_2.each_with_index do |rsr, index|
  #     rsr.update(position: index + railway_stations.size)
  #     binding.pry
  #   end
  # end
end
