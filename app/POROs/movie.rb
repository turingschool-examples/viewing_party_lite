class Movie
  attr_reader :title, :vote_average, :poster_path

  def initialize(details)
    @title = details[:title]
    @vote_average = details[:vote_average]
    @poster_path = details[:poster_path]
  end
end
