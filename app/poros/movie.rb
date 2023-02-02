class Movie
  attr_reader :id,
              :original_title,
              :vote_average,
              :poster,
              :runtime,
              :summary,
              :genres

  def initialize(attributes)
    @id             = attributes[:id]
    @original_title = attributes[:original_title]
    @vote_average   = attributes[:vote_average]
    @poster         = attributes[:poster_path]
    @runtime        = attributes[:runtime]
    @summary        = attributes[:overview]
    @genres         = attributes[:genres]
  end
end
