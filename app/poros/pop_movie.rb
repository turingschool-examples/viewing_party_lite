class PopMovie
  attr_reader :title,
              :vote_average,
              :movie_id

  def initialize(data)
# require "pry"; binding.pry
    @title = data[:title]
    @vote_average = data[:vote_average]
    @movie_id = data[:id]
  end
end

#put movie id
