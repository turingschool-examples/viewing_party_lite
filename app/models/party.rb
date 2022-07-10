class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :duration
  validates_presence_of :date
  validates_presence_of :start_time
  validates_presence_of :host 
  validates_presence_of :movie_id
  validates_presence_of :movie_title
  # validates_numericality_of :duration, greater_than_or_equal_to: movie_duration

  def host_name 
    User.all.where('id = ?', host).pluck('name').join(', ') 
  end

  def get_poster 
    movie = MovieFacade.search_by_id(movie_id)
    movie.poster_path
  end

  # def movie_duration
  #   movie = MovieFacade.search_by_id(movie_id)
  #   movie.duration
  # end
end
