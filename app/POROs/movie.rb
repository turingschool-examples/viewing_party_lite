class Movie
  attr_reader :id, :title, :vote_average, :poster_path

  def initialize(details)
    @id = details[:id]
    @title = details[:title]
    @vote_average = details[:vote_average]
    @poster_path = details[:poster_path]
  end
end
