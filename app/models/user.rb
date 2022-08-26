class User < ApplicationRecord
    #has_many :user_parties
    #has_many :parties, though: :user_parties

    validates_presence_of :name
    validates :email, uniqueness: true, presence: true
end