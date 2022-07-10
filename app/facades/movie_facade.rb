class MovieFacade

  def self.create_top_movies
    movies = MovieService.get_top_movies
    movies[0..49].map do |movie|
      Movie.new(movie)
    end
  end

  def self.create_search_movie(keyword)
    results = MovieService.get_search_movie(keyword)
    results.map do |movie|
      Movie.new(movie)
    end
  end
  def self.create_specific_movie(id)
    results = MovieService.get_specific_movie(id)
    Movie.new(results)
  end

  def self.create_cast(id)
    MovieService.get_cast(id)[:cast].map do |actor|
      name = actor[:name]
      character = actor[:character]
      "#{character}, played by #{name}"
    end.take(10)
  end

  def self.create_reviews(id)
    MovieService.get_reviews(id)[:results].map do |review|
      author = review[:author]
      content = review[:content]
      "#{author}: #{content}"
    end
  end

end
