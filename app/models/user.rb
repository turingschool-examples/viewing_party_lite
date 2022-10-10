class User < ApplicationRecord
  validates_presence_of :user_name, :password_digest, :email
  validates :email, uniqueness: true
end
