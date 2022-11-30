require './app/services/tmdb_services'
# require './app/poros/team'

class TopRatedSearch

  def movie_list
    movies = service.top_rated
    #require 'pry'; binding.pry
  end

  # def team_info(id)
  #   team = service.team(id)
  #   team = Team.new(team[:teams][0])
  # end

  def service
    TmdbService.new
  end
end
