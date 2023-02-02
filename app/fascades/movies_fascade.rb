class MoviesFascade
  def self.poster(title)
    response = MoviesService.movie_data(title)
    response[:results][0][:poster_path]
  end

  def self.movie_data(title)
    response = MoviesService.movie_data(title)
    results = response[:results][0..19]
    results.map do |data|
      Movie.new(data)
    end
  end

  def self.top_rated
    response = MoviesService.top_rated
    results = response[:results][0..19]
    results.map do |data|
      Movie.new(data)
    end
  end
end