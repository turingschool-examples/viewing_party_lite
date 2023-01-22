class Party < ApplicationRecord
  has_many :party_users
  has_many :users, through: :party_users

  def invited_users
    users.where('party_users.host = ?', false).pluck(:name)
  end

  def host
    users.where('party_users.host = ?', true).first.name
  end

  def movie_details
    movie_search = MovieSearch.new
    movie_search.retrieve_movie_by_name(movie_title)
  end
end
