class Party < ApplicationRecord
  has_many :invitations
  has_many :users, through: :invitations
  validates :valid_duration?, acceptance: true

  attr_accessor :movie_duration

  def valid_duration?
    unless movie_duration.nil?
      duration.to_i >= movie_duration
    end
  end
end
