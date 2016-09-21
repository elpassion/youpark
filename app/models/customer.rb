class Customer < ApplicationRecord
  validates :database, presence: true, uniqueness: true
  validates :name, presence: true
end
