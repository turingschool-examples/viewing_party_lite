class TopMovies

  def initialize(attributes)
    binding.pry
    @title = attributes[:original_title]
    @vote = attributes[:vote_average]
  end
end
