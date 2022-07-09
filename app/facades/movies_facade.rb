class MoviesFacade
  def self.movie_id_search(id)
   json = MovieService.all_movie_id_search(id)
   Movie.new(json)
 end

  def self.movie_cast(id)
   json_2 = MovieService.get_movie_cast(id)
   json_2[:cast].map do |actor|
     Actor.new(actor)
   end
 end

  def self.movie_reviews(id)
   json_3 = MovieService.get_reviews(id)
   json_3[:results].map do |author|
     Review.new(author)
   end
 end
end
