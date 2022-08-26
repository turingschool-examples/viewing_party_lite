class ViewParty < ApplicationRecord
    validates :party_duration, presence: true
    validates :event_date, presence: true
    has_many :user_view_party
    has_many :users, through: :user_view_party
end
