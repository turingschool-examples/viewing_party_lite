class MoviesTopRated
  # **Original code below ***
  # attr_reader :results 

  attr_reader :name, :id, :vote_average

  #Stephen note - initialize movie with id and name?
def initialize(movie_hash)
  @name = movie_hash[:title]
  @id = movie_hash[:id]
  @vote_average = movie_hash[:vote_average]
end

  #**Original method below**
  # def initialize(api)
  #   @results = api[:results]
  # end

end
