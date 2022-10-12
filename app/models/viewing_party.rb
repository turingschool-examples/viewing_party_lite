# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
  validates_presence_of :duration,
                        :date,
                        :movie_id,
                        :time
  def current_party(user_id)
    user_viewing_parties.where(user_id: user_id)[0]
  end

  def current_movie
    MovieFacade.create_individual_movie(movie_id)
  end
end
