class MovieFacade 
  def movie_ids 

  end

  def movies 
    MovieService.details.map do |data| 
      Movie.new(data)
    end
  end
end