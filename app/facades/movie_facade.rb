class MovieFacade

  def self.top_rated
    MovieService.top_rated[:results].map do |data|
      MovieResult.new(data)
    end
  end

  def self.movie_search(movie_name)
    movie_data = MovieService.search(movie_name)[:results]
    movie_data.map { |movie_hash| MovieResult.new(movie_hash) }
  end

  def self.find(movie_id)
    data = MovieService.movie_details(movie_id)
    MovieResult.new(data)
  end

  def self.get_reviews(movie_id)
    MovieService.get_reviews(movie_id)[:results].map do |data|
      Review.new(data)
    end
  end

  def self.get_cast(movie_id)
    MovieService.get_credits(movie_id)[:cast].map do |data|
      CastMember.new(data)
    end
  end
end
