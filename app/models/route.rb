# frozen_string_literal: true

class Route < ActiveRecord::Base
  validates :name, presence: true
end
