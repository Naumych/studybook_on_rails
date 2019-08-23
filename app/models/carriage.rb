# frozen_string_literal: true

class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, presence: true

  after_create :add_number_in_train

  CARRIAGE_TYPES = %w[EconomyCarriage CoupeCarriage SVCarriage SeatedCarriage].freeze

  def self.carriage_types
    CARRIAGE_TYPES
  end

  def add_number_in_train
    carriages_in_train = Carriage.where(train_id: train_id)
    number_in_train_presented = carriages_in_train.select { |carriage| carriage.number_in_train.present? }
    if number_in_train_presented.present?
      number_in_train_to_update = number_in_train_presented.map(&:number_in_train).max + 1
      update(number_in_train: number_in_train_to_update)
    else
      update(number_in_train: 1)
    end
  end
end
