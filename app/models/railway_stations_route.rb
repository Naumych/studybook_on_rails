# frozen_string_literal: true

class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }

  after_create :add_position

  private

  def add_position
    position_present = RailwayStationsRoute.where('position > 0')
    self.position = if position_present.present?
                      position_present.map(&:position).max + 1
                    else
                      1
                    end
    save
  end

  def update_position; end
end
