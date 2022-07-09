class MoviesService
  def self.get_url(url)

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params[:api_key] = ENV['movie_api_key']
    end

    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)

  end
  
  def self.get_top_rated
    get_url('3/movie/top_rated')[:results]
  end
end
