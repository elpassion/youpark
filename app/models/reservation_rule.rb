class ReservationRule < ApplicationRecord
  has_many :reservations
  belongs_to :owner

  delegate :parking_space, to: :owner
  delegate :user, to: :owner

  def lines
    (rules || []).map { |obj| ReservationRuleLine.new(obj) }
  end
end
