# frozen_string_literal: true

class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, presence: true

  # scope :economy, -> { where(type: 'EconomyCarriage') }
  # scope :coupe, -> { where(type: 'CoupeCarriage') }
  # scope :sv, -> { where(type: 'SVCarriage') }
  # scope :seated, -> { where(type: 'SeatedCarriage') }
  # scope :head_ordered, -> { where(train_id: train_id).order(:number_in_train) }
  # scope :tail_ordered, -> { where(train_id: train_id).order(number_in_train: :desc) }

  after_create :add_number_in_train

  def self.carriage_types
    %w[EconomyCarriage CoupeCarriage SVCarriage SeatedCarriage]
  end

  def add_number_in_train
    carriages_in_train = Carriage.where(train_id: train_id)
    Carriage.where(number_in_train: true)
    number_in_train_presented = carriages_in_train.select { |carriage| carriage.number_in_train.present? }

    # number_in_train_presented = Carriage.where(number_in_train: true)
    self.number_in_train = if number_in_train_presented.present?
                             number_in_train_presented.map(&:number_in_train).max + 1
                           else
                             1
                           end
    save
  end
end
