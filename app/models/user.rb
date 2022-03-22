class User < ApplicationRecord
   validates_presence_of :name, :email

   has_many :party_users 
   has_many :parties, through: :party_users
end
