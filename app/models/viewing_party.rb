class ViewingParty < ApplicationRecord
  validates_presence_of :movie_id

  has_many :user_parties
  has_many :users, through: :user_parties
end
