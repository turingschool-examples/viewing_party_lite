class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users
  validates :movie_id, presence: true

  def movie
    MovieFacade.movie_details(movie_id)
  end

  def movie_title
    movie.title
  end

  def movie_poster
    movie.poster_path
  end

  def movie_date
    time.strftime('%b %-d, %Y')
  end

  def movie_time
    time.strftime('%l:%M %p').lstrip
  end

  def host
    users.where(party_users: { is_host: true })[0]
  end

  def host_name
    host.name
  end

  def viewers
    users.where(party_users: { is_host: false })
  end
end
