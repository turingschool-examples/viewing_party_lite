class Movie
  attr_reader :vote_average, :title, :id, :runtime, :summary, :review_count, :cast, :reviews

  def initialize(data)
    @id = data[:id]
    @vote_average = data[:vote_average]
    @title = data[:original_title]
    @runtime = data[:runtime]
    @summary = data[:overview]
    @review_count = data[:vote_count]
      @cast = data[:credits][:cast] if data[:credits]
      @reviews = data[:reviews][:results] if data[:reviews]
  end

  def format_runtime
    hours = @runtime/60
    minutes = @runtime%60
    "#{hours} hours #{minutes} minutes"
  end
end
