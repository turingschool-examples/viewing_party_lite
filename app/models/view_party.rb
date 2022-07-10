# frozen_string_literal: true

class ViewParty < ApplicationRecord
  has_many :user_view_parties
  has_many :users, through: :user_view_parties

  validates_numericality_of :movie_api_id
  validates_numericality_of :duration
  validates_presence_of :date
  validates_presence_of :time
end
