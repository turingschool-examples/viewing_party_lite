class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  def start_date
    date.strftime('%B %e, %Y')
  end

  def time
    start_time.strftime('%I:%M %p')
  end

  def find_host
    User.find(host_id).name
  end

  def find_title
    MovieFacade.movie_data(movie_id).title
  end

  def find_image_url
    MovieFacade.movie_data(movie_id).image
  end
end
