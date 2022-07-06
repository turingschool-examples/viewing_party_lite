class User < ApplicationRecord
  has_many :user_viewing_party
  has_many :viewing_party, through: :user_viewing_party

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
