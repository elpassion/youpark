class Reservation < ApplicationRecord
  belongs_to :parking_space
  belongs_to :user
  belongs_to :reservation_rule

  scope :since, -> (date) { where('reservation_date >= ?', date) }
end
