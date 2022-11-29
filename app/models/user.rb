class User < ApplicationRecord
  validates_uniqueness_of :email,   :case_sensitive => false
  has_many :user_viewing_parties
  has_many :viewing_parties,   through: :user_viewing_parties
end
