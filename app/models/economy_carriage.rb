class EconomyCarriage < Carriage
  validates :side_top_seats, :side_lower_seats, presence: true
end
