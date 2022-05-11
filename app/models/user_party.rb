class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party
  validates_inclusion_of :host, in: [true, false]
end
