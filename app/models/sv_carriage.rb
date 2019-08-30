class SVCarriage < Carriage
  validates :bottom_seats, presence: true
  validate :zero_seats

  def zero_seats
    message = 'SVCarriage shouldn\'t have any seats exsept bottom'
    errors.add(:base, message) if top_seats != 0 || side_top_seats != 0 || side_bottom_seats != 0 || seats != 0
  end
end
