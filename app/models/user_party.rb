class UserParty < ApplicationRecord
  belongs_to :user_id
  belongs_to :party_id
end
