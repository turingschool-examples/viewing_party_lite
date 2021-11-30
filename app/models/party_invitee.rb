class PartyInvitee < ApplicationRecord
  belongs_to :party
  belongs_to :user

  validates_presence_of :party_id
  validates_presence_of :user_id
  validates_presence_of :status
end
