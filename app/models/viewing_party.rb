# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :movie_id, :duration, :date, :start_time

  def movie_data
    MovieFacade.movie_id_search(movie_id)
  end
end
