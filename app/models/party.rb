class Party < ApplicationRecord
  has_many :invitations
  has_many :users, through: :invitations

  def movie
    MovieFacade.details(movie_id)
  end

  def format_start_time
    date = event_date.strftime("%B %d, %Y")
    time = start_time.strftime("%I:%M")

    "#{date} at #{time}"
  end
end
