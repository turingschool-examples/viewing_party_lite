class MovieFacade
  def self.senate_member_by_name(search_term)
    data = CongressService.senate_members

    members = data[:results][0][:members]
    found_members = members.find_all {|m| m[:last_name] == search_term}
    SenateMember.new(found_members.first)
  end 

  def self.actors(movie_id)
    cast_data = MovieService.actors(movie_id)
    actors = cast_data[:cast].map do |actor_data|
      Actor.new(actor_data)
    end
  end

  def self.movie_details(movie_id)
    Movie.new(MovieService.movie_details(movie_id))
  end

  def self.review_details(movie_id)
    review_data = MovieService.review_details(movie_id)
    review = review_data[:results].map do |review_data|
      Review.new(review_data)
    end
  end
end