class ViewingParty < ApplicationRecord
  belongs_to :user
  has_many :party_users
  has_many :users, through: :party_users
  validates_presence_of :duration
  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :movie_id


  def display_title
    movie = MovieFacade.create_movie_details(movie_id)
    movie.title
  end
end
