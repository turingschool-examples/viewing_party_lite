class User < ApplicationRecord
  has_many :view_parties

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end