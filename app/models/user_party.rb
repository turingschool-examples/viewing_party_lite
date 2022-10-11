class UserParty < ApplicationRecord
  # enum user_status: 
  
  validates_presence_of :user_status

  belongs_to :user
  belongs_to :party
end