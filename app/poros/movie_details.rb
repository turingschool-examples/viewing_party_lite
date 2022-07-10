class MovieDetails
  attr_reader :title,
              :vote_average,
              :id,
              :runtime,
              :genre,
              :overview

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @id = data[:id]
    @runtime = data[:runtime]
    @genre = data[:genres].collect { |genre| genre[:name] }
    @overview = data[:overview]
  end
end
