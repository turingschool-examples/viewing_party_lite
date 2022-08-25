require 'date'
class TmdbSearch

  def service
    TmdbService.new
  end

  def top_rated(page)
   @_top_rated = JSON.parse(service.get_url.get("/3/movie/top_rated?page=#{page}").body, symbolize_names: true)[:results]
 end

 def keyword(name, page)
   # binding.pry
   @_search = JSON.parse(service.get_url.get("/3/search/movie?query=#{name}&page=#{page}").body, symbolize_names: true)[:results]
 end

 def find_movie_basic(id)
   @_basic = JSON.parse(service.get_url.get("/3/movie/#{id}").body, symbolize_names: true)[:results]
 end

 def find_movie_cast(id)
   @_cast = JSON.parse(service.get_url.get("/3/movie/#{id}/credits").body, symbolize_names: true)[:cast].limit(10)
 end

 def find_movie_review(id)
   @_reviews = JSON.parse(service.get_url.get("/3/movie/#{id}/reviews").body, symbolize_names: true)[:results]
 end

end
