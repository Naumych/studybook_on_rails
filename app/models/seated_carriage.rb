class SeatedCarriage < Carriage
  validates :seats, presence: true
  validate :zero_seats

  def zero_seats
    message = 'SeatedCarriage shouldn\'t have any seats exsept seats'
    errors.add(:base, message) if top_seats != 0 || bottom_seats != 0 || side_top_seats != 0 || side_bottom_seats != 0
  end
end
