class User < ApplicationRecord
  has_many :user_viewing_parties
  validates_presence_of :name,
                        :email,
                        :password_digest
end
