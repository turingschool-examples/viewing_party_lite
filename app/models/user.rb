class User < ApplicationRecord
    has_many :hosted_viewing_parties, class_name: "ViewingParty", foreign_key: 'host_id'
    has_many :viewing_party_invitees
    has_many :viewing_parties, through: :viewing_party_invitees
end