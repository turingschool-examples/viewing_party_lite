class Movie
  attr_reader :title,
              :vote_average,
              :vote_count,
              :id,
              :genres,
              :runtime,
              :overview



  def initialize(attributes)
      @title = attributes[:title]
      @id = attributes[:id]
      @vote_average = attributes[:vote_average]
      @vote_count = attributes[:vote_count]
      @genres = attributes[:genres].map { |genre| genre[:name] }
      @runtime = attributes[:runtime]
      @overview = attributes[:overview]
  end

end
