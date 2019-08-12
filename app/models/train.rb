# frozen_string_literal: true

class Train < ApplicationRecord
  validates :number, presence: true
end
