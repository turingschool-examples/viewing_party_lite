class Movie
  attr_reader :id,
    :title,
    :vote_average,
    :genres,
    :runtime,
    :summary

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @genres = attributes[:genres]
    @runtime = attributes[:runtime]
    @summary = attributes[:overview]
  end

  def formatted_runtime
    "#{runtime / 60} Hours and #{runtime % 60} Minutes"
  end
end
