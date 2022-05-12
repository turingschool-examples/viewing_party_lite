class Party < ApplicationRecord
  has_many :invitations
  has_many :users, through: :invitations

  def movie
    MovieFacade.details(movie_id)
  end
end
