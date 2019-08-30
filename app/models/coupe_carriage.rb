class CoupeCarriage < Carriage
  validates :top_seats, :bottom_seats, presence: true
  validate :zero_seats

  def zero_seats
    message = 'CoupeCarriage shouldn\'t have any seats exsept top and bottom'
    errors.add(:base, message) if side_top_seats != 0 || side_bottom_seats != 0 || seats != 0
  end
end
