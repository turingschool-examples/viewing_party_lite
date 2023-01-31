class ViewingParty < ApplicationRecord
  belongs_to :movie
  has_many :invitees
  has_many :users, through: :invitees
end
