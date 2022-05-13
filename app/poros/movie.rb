class Movie
  attr_reader :vote_average, :title, :id, :runtime, :summary, :review_count, :cast, :reviews

  def initialize(data)
    @id = data[:id]
    @vote_average = data[:vote_average]
    @title = data[:original_title]
    @runtime = data[:runtime]
    @summary = data[:overview]
    @review_count = data[:vote_count]
      @cast = data[:credits][:cast]
      @reviews = data[:reviews][:results]
    
  end
end