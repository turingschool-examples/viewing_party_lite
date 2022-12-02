class UserParty < ApplicationRecord
  enum user_status: { hosting: 0, invited: 1 }

  validates :user_id, :viewing_party_id, :user_status, presence: true

  belongs_to :user
  belongs_to :viewing_party
end
