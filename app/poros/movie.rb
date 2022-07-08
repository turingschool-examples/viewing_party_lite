class Movie
  attr_reader :title,
              :genre_ids,
              :popularity,
              :vote_average

  def initialize(data)
    @title = data[:title]
    @genre_ids = data[:genre_ids]
    @popularity = data[:popularity]
    @vote_average = data[:vote_average]
  end
end
