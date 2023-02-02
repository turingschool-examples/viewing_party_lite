class Movie
  attr_reader :id, :original_title, :vote_average, :poster

  def initialize(attributes)
    @id = attributes[:id]
    @original_title = attributes[:original_title]
    @vote_average = attributes[:vote_average]
    @poster = attributes[:poster_path]
  end
end