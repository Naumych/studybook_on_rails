# frozen_string_literal: true

class RailwayStation < ApplicationRecord
  validates :title, presence: true
end
