class ViewingParty < ApplicationRecord
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  def poster_path
    MovieDbFacade.find_by_movie_id(movie_id).poster_path
  end
end