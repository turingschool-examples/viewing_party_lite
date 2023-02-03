class MovieFacade
  def self.find_movie(movie_id)
    @movie = Movie.new(filter_movies("movie/#{movie_id}?api_key=#{ENV['movie_api_key']}&language=en-US"))
  end

  def self.find_cast(movie_id)
    @cast = filter_credits("movie/#{movie_id}/credits?api_key=#{ENV['movie_api_key']}&language=en-US").map do |character|
      Character.new(character)
    end
  end

  def self.find_reviews(movie_id)
    @reviews = filter_response("movie/#{movie_id}/reviews?api_key=#{ENV['movie_api_key']}&language=en-US").map do |review|
      Review.new(review)
    end
  end

  def self.find_movies(uri)
    if filter_movies(uri)[:success] == false
      filter_movies(uri)
    else
      filter_movies(uri)[:results].map do |movie|
        Movie.new(movie)
      end
    end
  end

  private

  def self.filter_movies(uri)
    MovieService.parse_response(uri)
  end

  def self.filter_response(uri)
    MovieService.parse_response(uri)[:results]
  end

  def self.filter_credits(uri)
    MovieService.parse_response(uri)[:cast][0..9]
  end
end