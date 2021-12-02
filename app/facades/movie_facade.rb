class MovieFacade
  def self.popular_movies
    response1 = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=05946dc2dc50df636962153f45926dbe&page=1")
    pop_movies1 = JSON.parse(response1.body, symbolize_names: true)
    response2 = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=05946dc2dc50df636962153f45926dbe&page=2")
    pop_movies2 = JSON.parse(response2.body, symbolize_names: true)

    # pop_movies1 = MovieService.call_api("/3/movie/top_rated?api_key=05946dc2dc50df636962153f45926dbe&page=1")
    # pop_movies2 = MovieService.call_api("/3/movie/top_rated?api_key=05946dc2dc50df636962153f45926dbe&page=2")

    # 40.times do
    #   pop_movies.map do |pop_movie|
    #     PopMovie.new(pop_movie)
    #   end
    # end
#make sure we get what we think we are getting and mind the pages

    movies1 = pop_movies1[:results].map do |pop_movie|
      PopMovie.new(pop_movie)
    end

    movies2 = pop_movies2[:results].map do |pop_movie|
      PopMovie.new(pop_movie)
    end

    movies1 + movies2

  end

  def self.movie_search(keyword)

  end
end
# hide the key
#https://developers.themoviedb.org/3/movies/get-top-rated-movies
# https://api.themoviedb.org/3/movie/top_rated
