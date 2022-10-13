class ViewingPartyUser < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party
  enum status: %i[hosting invited]
end
