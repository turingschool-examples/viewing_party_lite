class MovieCastFacade
  def self.cast(movie_id)
   data =  TMDBService.get_movie_cast(movie_id)
    cast = data[:cast]
    cast[0..9].map do |actor|
      MovieCast.new(actor)
    end
  end

end