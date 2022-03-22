class UserParty < ApplicationRecord 
  belongs_to :user
  belongs_to :viewing_party

  validates_presence_of :host
end