class CastMembersFacade
  def self.cast(movie_id)
    json = MoviesService.credits(movie_id)

    @cast = json[:cast].first(10).map do |cast_member|
      CastMember.new(cast_member)
    end
  end
end