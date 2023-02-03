# frozen_string_literal: true

class ViewingParty < ApplicationRecord
  has_many :viewing_party_users, dependent: :destroy
  has_many :users, through: :viewing_party_users, dependent: :destroy

  validates :duration, presence: true
  validates :party_date, presence: true
  validates :party_time, presence: true
  validates :host_id, presence: true

  def collect_display_data
    movie = MovieFacade.get_movie(movie_id)
    host = User.find(host_id)
    party_info = {
      movie_id: movie.id,
      image: "https://image.tmdb.org/t/p/w500/#{movie.image_url}",
      title: movie.title,
      duration: duration,
      date: party_date,
      time: party_time,
      host: host.name,
      attendees: users
    }
  end
end
