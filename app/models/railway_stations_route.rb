# frozen_string_literal: true

class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route
end
