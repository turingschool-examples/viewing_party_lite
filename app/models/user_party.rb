class UserParty < ApplicationRecord 
  validates_presence_of :user_id, :viewing_party_id

  belongs_to :user
  belongs_to :viewing_party 
  
end