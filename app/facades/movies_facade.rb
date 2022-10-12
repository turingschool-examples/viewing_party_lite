class MoviesFacade
  def self.top_rated
    response = MoviesService.top_rated

    response[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def self.search(keyword)
    response = MoviesService.search(keyword.gsub(" ", "+"))

    movies = response[:results].map do |movie|
      Movie.new(movie)
    end

    found_movies = []

    movies.each do |movie|
      keyword.split.each do |word|
        if movie.title.include?(word)
          found_movies << movie
        end
      end
    end

    found_movies.uniq.first(40)
  end
end