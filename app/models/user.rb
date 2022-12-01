class User < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :email,   :case_sensitive => false
  validates_presence_of :email
  has_many :user_viewing_parties
  has_many :viewing_parties,   through: :user_viewing_parties
end
