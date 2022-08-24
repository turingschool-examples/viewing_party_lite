class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    has_many :user_view_party
    has_many :view_parties, through: :user_view_party
end
