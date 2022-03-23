# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  belongs_to :user
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
  validates_presence_of :movie_id

  after_validation :assign_duration
  after_save :add_host_to_user_viewing_parties

  private

  def assign_duration
    self.duration = MovieFacade.new(movie_id).movie.minutes
  end

  def add_host_to_user_viewing_parties
    UserViewingParty.create!(viewing_party: self, user: user)
  end
end
