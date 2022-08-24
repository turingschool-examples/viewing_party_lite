class ViewingPartyUser < ApplicationRecord
  belongs_to :viewing_party
  belongs_to :user

  validates :host, inclusion: [true, false]
end
