# frozen_string_literal: true

class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }

  after_create :add_position

  private

  def add_position
    position_present = RailwayStationsRoute.where('position > 0')
    if position_present.present?
      new_position = position_present.map(&:position).max + 1
      update(position: new_position)
    else
      update(position: 1)
    end
  end
end
