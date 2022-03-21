class UserViewingParty < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  validates_presence_of :user_id
  validates_presence_of :viewing_party_id
end
