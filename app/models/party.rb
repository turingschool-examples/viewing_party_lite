# frozen_string_literal: true

class Party < ApplicationRecord
  validates :start_time, :duration, :movie_title, presence: true
  has_many :party_users
  has_many :users, through: :party_users
  belongs_to :host, class_name: 'User', optional: true

  def movie_details
    @movie_details ||= MovieFacade.find(self.movie_id)
  end

  def movie_poster_url
    # Return the url if it is already stored in the database...
    return self[:movie_poster_url] if self[:movie_poster_url].present?

    # Otherwise, fetch it from the API and add it to the database.
    self[:movie_poster_url] = movie_details.poster
    save!
    self[:movie_poster_url]
  end
end
