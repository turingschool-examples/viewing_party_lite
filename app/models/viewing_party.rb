class ViewingParty < ApplicationRecord
  belongs_to :user
  has_many :user_parties
  has_many :users, through: :user_parties
end
