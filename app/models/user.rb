class User < ApplicationRecord 
    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_presence_of :email
    validates_presence_of :password
    validates :email, uniqueness: true

    validates :password_digest, presence: true

    has_secure_password

    has_many :viewing_party_users
    has_many :viewing_parties, through: :viewing_party_users

    def self.all_without_current_user(user_id)
        where("id != ?", user_id)
    end 
end 