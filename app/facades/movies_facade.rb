class MoviesFacade
  def self.top_rated
    response = MoviesService.top_rated

    response[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def self.search(keyword)
    response = MoviesService.search(keyword.titleize.gsub(" ", "+"))

    movies = response[:results].map do |movie|
      Movie.new(movie)
    end

    found_movies = []

    movies.each do |movie|
      keyword.titleize.split.each do |word|
        if movie.title.include?(word)
          found_movies << movie
        end
      end
    end

    found_movies.uniq.first(40)
  end

  def self.details(movie_id)
    response = MoviesService.details(movie_id)

    MovieDetailed.new(response)
  end

  def self.images(movie_ids)
    movie_ids.each_with_object({}) do |movie_id, hash|
      response = MoviesService.details(movie_id)
      movie = MovieDetailed.new(response)
      hash[movie.id] = movie.poster_path
    end
  end
end
