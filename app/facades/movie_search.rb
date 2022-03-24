class MovieSearch
  def search(movie)
    MovieService.search_for_movie(movie).map do |data|
      Movie.new(data)
    end
  end
end
