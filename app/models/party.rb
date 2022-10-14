class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties
  validates :start_time, :date, :duration, presence: true

  def movie
    @movie ||= MovieFacade.movie_by_id(movie_id)
  end

  def poster_path
    movie.poster_path
  end

  def title
    movie.title
  end

  def host
    u_p = user_parties.find_by is_host: true
    {id: u_p.user_id, name: u_p.user.name}
  end
end
