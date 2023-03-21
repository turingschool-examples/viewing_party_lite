class UserParty < ApplicationRecord
  validates_presence_of :host
  
  belongs_to :user
  belongs_to :viewing_party
end
