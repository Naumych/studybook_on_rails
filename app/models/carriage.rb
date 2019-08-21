# frozen_string_literal: true

class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, :top_seats, :bottom_seats, presence: true

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :sv, -> { where(type: 'SVCarriage') }
  scope :seated, -> { where(type: 'SeatedCarriage') }
  scope :ordered, -> { order(:number) }

  # after_create :add_number_in_train

  def self.carriage_types
    %w[compartment econom-class]
  end

  def add_number_in_train
    Carriage.where(train_id: train_id)
    position_present = RailwayStationsRoute.where('position > 0')
    self.position = if position_present.present?
                      position_present.mapositionp(&:position).max + 1
                    else
                      1
                    end
    save
  end

end
