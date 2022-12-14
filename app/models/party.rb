# frozen_string_literal: true

class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :movie_title, :duration, :date, :time, :host_id
  validates_numericality_of :duration

  def find_host_name
    User.find(host_id).name
  end
end
