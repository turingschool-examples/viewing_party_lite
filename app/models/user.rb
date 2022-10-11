class User < ApplicationRecord
    has_many :hosted_viewing_parties, class_name: "ViewingParty", foreign_key: 'host_id'
    has_many :viewing_party_invitees
    has_many :viewing_parties, through: :viewing_party_invitees

    validates_presence_of :name, :email
    validates_uniqueness_of :email
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, message: "is not formatted correctly"
end