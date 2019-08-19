# frozen_string_literal: true

class Carriage < ApplicationRecord
  validates :carriage_type, presence: true
  belongs_to :train

  def self.carriage_types
    %w[compartment econom-class]
  end
end
