class ViewParty < ApplicationRecord
    
    has_many :user_view_party
    has_many :users, through: :user_view_party
end
