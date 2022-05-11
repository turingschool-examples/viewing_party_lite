class CastMemberFacade
  def self.cast_members(movie_id)
    cast = MovieService.cast_members(movie_id)[:cast][0..9]
    cast.map do |cast_member_hash|
      CastMember.new(cast_member_hash)
    end
  end
end
