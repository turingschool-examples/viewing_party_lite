class MovieResult
  attr_reader :id, :title, :vote_average, :runtime, :genres, :summary
  
  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
  end

  def formatted_runtime
    hours = runtime / 60
    minutes = runtime % 60
    "#{hours} hours #{minutes} minutes"
  end
end
