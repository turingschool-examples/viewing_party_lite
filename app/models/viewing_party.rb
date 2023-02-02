class ViewingParty < ApplicationRecord
  has_many :invitees
  has_many :users, through: :invitees
end
