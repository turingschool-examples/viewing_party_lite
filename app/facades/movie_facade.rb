require_relative '../services/movie_service'

class MovieFacade
  def self.movie_title(movie_id)
    MovieService.movie_details(movie_id)[:title]
  end

  def self.movie_image(movie_id)
    MovieService.movie_details(movie_id)[:poster_path]
  end

  def self.vote_average(movie_id)
    MovieService.movie_details(movie_id)[:vote_average]
  end

  def self.runtime(movie_id)
    MovieService.movie_details(movie_id)[:runtime]
  end

  def self.genres(movie_id)
    MovieService.movie_details(movie_id)[:genres].map do |key|
      key[:name]
    end
  end

  def self.summary_description(movie_id)
    MovieService.movie_details(movie_id)[:overview]
  end

  def self.first_10_cast_members(movie_id)
    MovieService.movie_credits(movie_id)[:cast].sort_by{ |actor| actor[:order].to_i }.map do |actor|
      [actor[:name], actor[:character]]
    end.first(10)
  end

end