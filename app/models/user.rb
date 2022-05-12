class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :email, presence: true, uniqueness: { scope: :id, message: '** Email Already Exists **' }
end
