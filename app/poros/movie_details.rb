class MovieDetails 
  attr_reader :partial_image_path, :title, :runtime, :genres, :vote, :summary, :id

  def initialize(data)
    @partial_image_path = data[:poster_path]
    @title = data[:title]
    @runtime = data[:runtime]
    @genres = data[:genres].map { |genre| genre[:name] }
    @vote = data[:vote_average]
    @summary = data[:overview]
    @id = data[:id]
  end

  def runtime_in_hours_and_min
    "#{@runtime/60}hr #{@runtime % 60}min"
  end
end