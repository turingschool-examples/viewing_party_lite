class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates_presence_of :date
  validates_presence_of :start_time

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

  def image 
    #this will return the url path for the movie image for that party
    movie = MovieSearch.new.movie(movie_id)
    config_path = ConfigSearch.new.base_path
    "#{config_path}w200#{movie.partial_image_path}"
  end
end