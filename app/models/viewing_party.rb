class ViewingParty < ApplicationRecord
  belongs_to :user
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  validates_presence_of :user_id
  validates :movie_id, presence: true, numericality: true 
  validates_presence_of :day 
  validates_presence_of :start_time 
  validates :duration, presence: true, numericality: true
end
