class PartyGuest < ApplicationRecord
  belongs_to :view_party

  validates :view_party_id, presence: true
  validates :guest_id, presence: true
end