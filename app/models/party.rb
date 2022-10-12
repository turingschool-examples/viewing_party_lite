class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties
  validates :start_time, :date, :duration, presence: true

  def movie
    MovieFacade.movie_by_id(movie_id)
  end

  def poster_path
    movie.poster_path
  end

  def host?(user)
    u_p = user_parties.find_by user_id: user.id
    u_p.is_host
  end
end
