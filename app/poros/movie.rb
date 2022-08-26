class Movie
  attr_reader :id, :vote_average, :title, :summary

  def initialize(data)
    @id = data[:id]
    @vote_average = data[:vote_average]
    @title = data[:title]
    # @runtime = data[:runtime]
    @summary = data[:overview]
    # @review_count = data[:reviews][:total_results] if data[:reviews]
    #   @cast = data[:credits][:cast] if data[:credits]
    #   @reviews = data[:reviews][:results] if data[:reviews]
    #   @genres = data[:genres].map{ |genre_hash| genre_hash[:name]} if data[:genres]
  end
end
