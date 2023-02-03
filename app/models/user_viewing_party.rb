class UserViewingParty < ApplicationRecord
  belongs_to :viewing_party
  belongs_to :user

  validates_inclusion_of :hosting, in: [true, false]
end
