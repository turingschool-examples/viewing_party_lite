class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party

  validates_presence_of :user_id
  validates_presence_of :party_id
end
