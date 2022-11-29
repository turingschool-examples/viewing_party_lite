class UserParty < ApplicationRecord 
  enum user_status: { hosting: 0, invited: 1 }
  
  validates_presence_of :user_id, :viewing_party_id, :user_status

  belongs_to :user
  belongs_to :viewing_party 

end