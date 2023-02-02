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
    # movie = movie_data
  end
end