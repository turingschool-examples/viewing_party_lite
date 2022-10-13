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
    # require 'pry',binding.pry
    @genres = attributes[:genres].map { |genre| genre[:name] }
    @runtime = attributes[:runtime]
    @overview = attributes[:overview]
  end
end

# Movie Title
# Vote Average of the movie

# Runtime in hours & minutes
# Genre(s) associated to movie
# Summary description
# List the first 10 cast members (characters&actress/actors)
#
# Count of total reviews
# Each review's author and information
# Details: This information should come from 3 different endpoints from The Movie DB API
