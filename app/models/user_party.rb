class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party

  validates_presence_of :host
end
