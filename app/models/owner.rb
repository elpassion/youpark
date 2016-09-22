class Owner < ApplicationRecord
  belongs_to :user
  belongs_to :parking_space
end
