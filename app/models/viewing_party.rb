class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates_presence_of :date
  validates_presence_of :start_time
  validates_presence_of :duration
  validates_numericality_of :duration, only_integer: true, greater_than_or_equal_to: :run_time


  def host 
    users
      .joins(:user_viewing_parties)
      .find_by("user_viewing_parties.status = 'Hosting'")
      .name
  end

  def invitees
    users
      .includes(:user_viewing_parties)
      .where("user_viewing_parties.status = 'Invited'").to_a
      .pluck(:name)
  end

  def image(user_id)
    #this will return the url path for the movie image for that party
    MovieDetailsFacade.new(user_id, movie_id).image_path
  end
end