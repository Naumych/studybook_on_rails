class EconomyCarriage < Carriage
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, presence: true
  validate :zero_seats

  def zero_seats
    message = 'EconomyCarriage shouldn\'t have any seats exsept top, bottom, side_top and side_bottom'
    errors.add(:base, message) if seats != 0
  end
end
