# frozen_string_literal: true

class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  def find_host
    host = user_parties.find_by(host: true).user_id
    User.find(host)
    # binding.pry
  end

  def movie
    MovieFacade.movie_details(movie_id)
  end
end
