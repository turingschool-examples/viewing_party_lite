class ViewingParty < ApplicationRecord
  has_many :invitees
  has_many :users, through: :invitees

  validates_presence_of :duration, :when, :start_time, :movie_id

  def get_movie
    Movie.where('api_id = ?', self.movie_id)[0]
  end

  def get_host
    invitee = self.invitees.select('users.*').joins(:user).where('host = ?', true)[0]
    User.find(invitee.id)
  end
end
