require 'date'
class TmdbSearch

  def service
    TmdbService.new
  end

  def top_rated
   @_top_rated = JSON.parse(service.get_url.get('/3/movie/top_rated').body, symbolize_names: true)[:results].map do |movie_data|
     Movie.new(movie_data)
   end
 end

 def keyword(name)
   @_search = JSON.parse(service.get_url.get("/3/search/movie?query=#{name}").body, symbolize_names: true)[:results].map do |movie_data|
     Movie.new(movie_data)
   end
 end

end
