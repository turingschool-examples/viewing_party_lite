class Movie
  attr_reader :title, 
                    :id, 
                    :vote_average, 
                    :runtime,
                    :image,
                    :genres,
                    :overview,
                    :cast,
                    :reviews

  def initialize(info, credits = nil, reviews = nil)
    @title = info[:title]
    @id = info[:id]
    @vote_average = info[:vote_average]
    @runtime = info[:runtime]
    @image = info[:poster_path]
    @genres = info[:genres]
    @overview = info[:overview]
    if credits.nil?
      @cast = nil
    else
      @cast = credits[:cast]
    end
    if reviews.nil?
      @reviews = nil
    else
      @reviews = reviews[:results]
    end
  end
end
