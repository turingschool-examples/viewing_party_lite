class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates_numericality_of :duration
  validates_presence_of :date, :duration, :movie_id, :start_time
  validates_with DurationValidator

  def movie
    MovieFacade.find_movie(self.movie_id) if self.movie_id
  end

  def host
    self.user_viewing_parties.find_by(hosting: true).user.name
  end

  def invitees
    self.user_viewing_parties.filter_map { |uvp| uvp.user.name unless uvp.hosting }
  end
end
