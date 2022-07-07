class MoviesService
  def self.get_top_rated_movies(top_rated)
    response = connection.get(end_point) do |faraday|
      faraday.params['']
    end
  end

  def self.connection
    url = 'https://api.themoviedb.org'
    Faraday.new(url: url)
  end
end
