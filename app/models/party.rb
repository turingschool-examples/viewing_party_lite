class Party < ApplicationRecord
   validates_presence_of :duration, :date, :start_time

   has_many :party_users 
   has_many :users, through: :party_users
end
