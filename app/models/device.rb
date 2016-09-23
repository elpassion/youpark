class Device < ApplicationRecord
  enum provider: [:ios, :android]

  belongs_to :user

  validates :provider, presence: true
  validates :token, presence: true, uniqueness: { scope: :provider }
  validates :user_id, presence: true
end
