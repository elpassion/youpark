class Reservation < ApplicationRecord
  belongs_to :parking_space
  belongs_to :user
  belongs_to :reservation_rule

  scope :since, -> (date) { where('reservation_date >= ?', date) }
  scope :free,  -> { where(user_id: nil) }
  scope :on_date, -> (date) { where(reservation_date: date) }
end
