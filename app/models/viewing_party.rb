class ViewingParty < ApplicationRecord
    belongs_to :host, class_name: 'User'
    has_many :viewing_party_invitees
    has_many :users, through: :viewing_party_invitees
end