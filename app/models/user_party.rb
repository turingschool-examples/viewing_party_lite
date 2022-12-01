class UserParty < ApplicationRecord
  validates_presence_of :user_id
  validates_presence_of :party_id

  belongs_to :user
  belongs_to :party
end