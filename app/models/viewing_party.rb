# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates_presence_of :movie_title
  validates_presence_of :duration
  validates_presence_of :date
  validates_presence_of :start_time
  validates_presence_of :status

end
