class MovieFacade
  def self.top_rated_movies
    json = MovieService.top_rated_movies

    json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.search(keywords)
    json = MovieService.search(keywords)

    json[:results][0..39].map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movie_details(movie_id)
    json = MovieService.movie_details(movie_id)

    MovieDetails.new(json)
  end

  def self.reviews(movie_id)
    # binding.pry
    json = MovieService.reviews(movie_id)

    json[:results].map do |result|
      Reviews.new(result)
    end

  end

  def self.cast_members(movie_id)
    json = MovieService.cast_members(movie_id)

    json[:cast][0..9].map do |data|
      CastMember.new(data)
    end

  end
end
