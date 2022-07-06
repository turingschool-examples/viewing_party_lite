class UserViewingParty < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  validates_inclusion_of :host, in: [true, false]
end
