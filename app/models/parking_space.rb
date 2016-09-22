class ParkingSpace < ApplicationRecord
  has_many :owners
  has_many :users, through: :owners

  has_many :reservations
end
