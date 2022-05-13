class Movie
  attr_reader :vote_average, :title, :id, :runtime, :summary, :review_count, :cast, :reviews, :genres

  def initialize(data)
    @id = data[:id]
    @vote_average = data[:vote_average]
    @title = data[:original_title]
    @runtime = data[:runtime]
    @summary = data[:overview]
    @review_count = data[:reviews][:total_results] if data[:reviews]
      @cast = data[:credits][:cast] if data[:credits]
      @reviews = data[:reviews][:results] if data[:reviews]
      @genres = data[:genres].map{ |genre_hash| genre_hash[:name]} if data[:genres]
  end

  def format_runtime
    hours = @runtime/60
    minutes = @runtime%60
    "#{hours} hours #{minutes} minutes"
  end

end
