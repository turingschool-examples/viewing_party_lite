class Movie < ApplicationRecord
  has_many :parties

  def get_poster
    jpeg = MovieService.get_movie(self.api_id).poster
    "https://image.tmdb.org/t/p/w200#{jpeg}"
  end

  def get_info
    MovieService.get_movie(self.api_id)
  end
end
