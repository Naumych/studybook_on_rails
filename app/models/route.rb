class Route < ActiveRecord::Base
  validates :number, presence: true
end 