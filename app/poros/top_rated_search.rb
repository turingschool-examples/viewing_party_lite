require './app/services/tmdb_services'
require './app/poros/movie'

class TopRatedSearch

  def movie_list
    movies = service.top_rated
    movies = movies[:results].first(20)
    movies.map { |movie_hash| Movie.new(movie_hash) }
  end

  # def team_info(id)
  #   team = service.team(id)
  #   team = Team.new(team[:teams][0])
  # end

  def service
    TmdbService.new
  end
end
