class ViewingParty < ApplicationRecord
  belongs_to :user
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
  validates_presence_of :movie_id

  after_validation :assign_duration 

  private 
  def assign_duration
    self.duration = MovieFacade.new(self.movie_id).movie.minutes
  end
end
