# frozen_string_literal: true

class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  def carriages_depending_on_type(carriages, carriage_type)
    carriages.select { |car| car.carriage_type == carriage_type }
  end

  # carriage_type = 'econom_class'/'compartment', seats_level = top_seats/lower_seats
  def seats_count_in_all_carriages(carriages, carriage_type, seats_level)
    carriages = carriages_depending_on_type(carriages, carriage_type)
    carriages.sum do |car|
      if seats_level == 'top_seats'
        car.top_seats_count
      elsif seats_level == 'lower_seats'
        car.lower_seats_count
      end
    end
  end
end
