class User < ApplicationRecord
  has_many :viewing_parties
  has_many :user_viewing_parties
end
