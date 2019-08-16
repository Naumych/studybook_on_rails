# frozen_string_literal: true

class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  def carriages_depending_on_type(carriage_type)
    carriages.select { |carriage| carriage.carriage_type == carriage_type }
  end

  def carriages_number_depending_on_type(carriage_type)
    carriages_depending_on_type(carriage_type).size
  end

  def top_seats_count(carriage_type)
    carriages_depending_on_type(carriage_type).sum(&:top_seats_count)
  end

  def lower_seats_count(carriages)
    carriages_depending_on_type(carriage_type).sum(&:lower_seats_count)
  end
end
