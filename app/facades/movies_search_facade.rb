class MoviesSearchFacade
  attr_reader :user_id, :query_params 

  def initialize(user_id, query_params)
    @user_id = user_id
    @query_params = query_params
  end

  def top_rated_movies
    service.top_rated_movies[:results].map do |data|
      Movie.new(data)
    end
  end

  def service
    MovieService.new
  end

  def movies_keyword
    service.movies_keyword(@query_params)[:results].map do |data|
      Movie.new(data)
    end
  end

  def user
    User.find(@user_id)
  end
end
