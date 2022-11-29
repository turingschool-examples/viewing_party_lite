class UserViewingParty < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  #validations of user id, viewing party id, role..?
  validates :user_id, presence: true
  validates :viewing_party_id, presence: true
end
