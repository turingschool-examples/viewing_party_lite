class MovieDetailsFacade
  attr_reader :user_id, :id

  def initialize(user_id, id)
    @user_id = user_id
    @id = id
  end

  def movie
    data = service.movie_details(@id)
    MovieDetails.new(data)
  end

  def reviews
    data_array = service.movie_reviews(@id)[:results]
    data_array.select { |data| data[:author] != "" }.map do |data| 
      Review.new(data)
    end
  end

  def base_path
    data = service.config_base_path
    data[:images][:base_url]
  end

  def cast_list
    service.movie_cast(@id)[:cast].take(10).map do |data|
      Actor.new(data)
    end
  end

  def image_path
    "#{base_path}w200#{movie.partial_image_path}"
  end

  def service 
    MovieService.new
  end

  def user
    User.find(@user_id)
  end

  def users
    User.where.not(id: @user_id)
  end
end