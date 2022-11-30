class MovieDetails 
  attr_reader :partial_image_path, :title, :runtime, :genre, :vote, :summary

  def initialize(data)
    @partial_image_path = data[:poster_path]
    @title = data[:original_title]
    @runtime = data[:runtime]
    @genres = data[:genres].map { |genre| genre[:name] }
    @vote = data[:vote_average]
    @summary = data[:overview]
  end
end