# frozen_string_literal: true

class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  def train_carriages
    @train_carriages ||= {}
  end

  def train_carriages_info
    types = carriages.map(&:carriage_type).uniq
    types.each do |type|
      carriages_by_type = carriages.select { |carriage| carriage.carriage_type == type }
      train_carriages[type] = { top_seats_count: carriages_by_type.sum(&:top_seats_count),
                                lower_seats_count: carriages_by_type.sum(&:lower_seats_count),
                                size: carriages_by_type.size }
    end
    train_carriages
  end
end
