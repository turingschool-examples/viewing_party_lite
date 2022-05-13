class Movie
  attr_reader :title, :vote_average, :summary, :genre, :poster

  def initialize(data)
    require "pry"
    binding.pry
    @title = data[:original_title]
    @vote_average = data[:vote_average]
    @summary = data[:overview]
    @genre = data[:genre_ids]
    @poster = data[:poster_path]
    # runtime
    # cast_members
    # reviews
  end
end
