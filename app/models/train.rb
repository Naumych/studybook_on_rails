# frozen_string_literal: true

class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  def seats_count(carriage_type, *args)
    args.each { |seat_type| puts "Sum of #{seat_type} - #{carriages.where(type: carriage_type).sum(&seat_type.to_sym)}" }
  end

  def train_carriages_info
    train_carriages = {}
    Carriage.carriage_types.each do |type|
      carriages_by_type = carriages.select { |carriage| carriage.type == type }
      train_carriages[type] = { count: carriages_by_type.size,
                                top_seats: carriages_by_type.sum(&:top_seats),
                                side_top_seats: carriages_by_type.sum(&:side_top_seats),
                                side_bottom_seats: carriages_by_type.sum(&:side_bottom_seats),
                                seats: carriages_by_type.sum(&:seats) }
    end
    train_carriages
  end

  def ordered
    if sort
      carriages.order(number_in_train: :desc)
    else
      carriages.order(:number_in_train)
    end
  end
end
