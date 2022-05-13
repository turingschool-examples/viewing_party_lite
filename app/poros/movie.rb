class Movie 
  attr_reader :title, :id, :vote_average, :runtime, :original_title, :poster_path

  def initialize(data)
    @title = data[:title]
    @id = data[:id]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @original_title = data[:original_title]
    @poster_path = data[:poster_path]
  end 
end 