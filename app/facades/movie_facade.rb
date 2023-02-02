class MovieFacade
  def self.get_movie(id)
    movie_info = MovieService.get_movie(id)  
    movie_detail = MovieDetail.new(movie_info)
  end
  
  def self.top_cast(id)
    # binding.pry
    cast = TopCastService.get_cast(id)[:cast][0..9]
    cast.map do |data|
      # binding.pry
      Actor.new(data)
    end
  end
end