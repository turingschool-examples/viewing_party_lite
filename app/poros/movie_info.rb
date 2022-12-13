class MovieInfo
  attr_reader :id,
              :title,
              :vote_average,
              :genre_ids,
              :overview,
              :vote_count

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @overview = attributes[:overview]
    @vote_count = attributes[:vote_count]
    @genre_ids = attributes[:genre_ids]
  end 
end