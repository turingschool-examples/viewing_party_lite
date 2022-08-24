class User < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :email
    has_many :user_view_party
    has_many :view_parties, through: :user_view_party
end
