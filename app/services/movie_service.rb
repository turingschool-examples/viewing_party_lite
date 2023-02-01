class MovieService
  def initialize
    @conn = Faraday.new(url: "https://api.themoviedb.org/3")
  end

  def movie(id)
    response = @conn.get("/3/movie/#{id}?api_key=05c2cc0439c2ee12465d6fb2652cc6c4")
    JSON.parse(response.body, symbolize_names: true)
  end
end
