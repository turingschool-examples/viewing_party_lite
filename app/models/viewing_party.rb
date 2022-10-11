# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
  validates_presence_of :duration,
                        :date,
                        :movie_id
end
