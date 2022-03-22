class User < ApplicationRecord
   validates_presence_of :name, :email 
   validates_uniqueness_of :email, case_sensitive: false

   has_many :party_users
   has_many :parties, through: :party_users
end
