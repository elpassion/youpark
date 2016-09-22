class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable

  validates :name, presence: true

  has_many :owners
  has_many :parking_spaces, through: :owners
end
