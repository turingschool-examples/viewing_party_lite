class User < ApplicationRecord
  has_many :viewing_parties, foreign_key: 'host_id'
  validates :name, presence: true
  validates :email, presence: true
end
