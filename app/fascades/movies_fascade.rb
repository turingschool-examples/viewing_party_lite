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
  def self.find(id)
    response = MoviesService.find(id)
    Movie.new(response)
  end
  def self.cast(id)
    response = MoviesService.cast(id)
    response[:cast][0..9]
  end
  def self.reviews(id)
    response = MoviesService.reviews(id)
    results = response[:results]
  end
end