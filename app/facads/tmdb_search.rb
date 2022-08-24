require 'date'
class TmdbSearch

  def service
    TmdbService.new
  end

  def top_rated
   @_top_rated = JSON.parse(service.get_url.get('/3/movie/top_rated').body, symbolize_names: true)[:results].map do |movie_data|
     binding.pry
     Movie.new(movie_data)
   end
 end

end
