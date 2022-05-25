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

  def movie
    MovieFacade.details(movie_id)
  end

  def format_start_time
    date = event_date.strftime("%B %d, %Y")
    time = start_time.strftime("%I:%M")
    "#{date} at #{time}"
  end

  def host_name
    User.find(user_id).name
  end
end
