# frozen_string_literal: true

class TrainsRoute < ActiveRecord::Base
  belongs_to :train
  belongs_to :route
end
