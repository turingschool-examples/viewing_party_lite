class ViewingParty < ApplicationRecord
  validates_presence_of :movie_title, :duration, :date, :start_time

  has_many :user_parties 
  has_many :users, through: :user_parties 
end