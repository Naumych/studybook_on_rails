# frozen_string_literal: true

class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :carriages

  def ordered
    if sort
      carriages.order(:number_in_train)
    else
      carriages.order(number_in_train: :desc)
    end
  end
end
