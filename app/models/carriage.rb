# frozen_string_literal: true

class Carriage < ApplicationRecord
  validates :carriage_type, presence: true
  belongs_to :train

  CARRIAGE_TYPES = %w[compartment econom-class].freeze

  def self.carriage_types
    CARRIAGE_TYPES
  end
end
