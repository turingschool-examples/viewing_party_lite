class ViewingParty < ApplicationRecord
  belongs_to :user
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  validates_presence_of :user_id
  validates :movie_id, presence: true, numericality: true 
  validates :runtime, presence: true, numericality: true 
  validates :day, presence: true, on: :minimum_date
  validates :start_time, presence: true
  validates :duration, presence: true, numericality: true, length: { minimum: :runtime }

  def minimum_date
    unless day >= Date.today
      errors.add(:day, "Invalid Date")
    end
  end
  
end
