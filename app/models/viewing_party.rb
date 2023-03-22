# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :viewing_party_users
  has_many :users, through: :viewing_party_users

  validates_presence_of :duration,
                        :date,
                        :start_time,
                        :movie_id

  def movie
    movie ||= MovieFacade.new(movie_id).movie
  end
end
