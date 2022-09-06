class User < ApplicationRecord
    validates_presence_of :name, :email
    validates_uniqueness_of :email, required: true 
    validates_presence_of :password_digest, required: true

    has_secure_password 

    has_many :user_parties
    has_many :parties 
    has_many :parties, through: :user_parties


    def hosting
        parties.where(user_id: id)
    end 
end 



