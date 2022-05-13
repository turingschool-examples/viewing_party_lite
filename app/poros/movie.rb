class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :cast,
              :reviews

  def initialize(result)
    @id = result[:id]
    @title = result[:title]
    @runtime = result[:runtime]
    @vote_average = result[:vote_average]
    @runtime = result[:runtime]
    @cast = get_cast(result)
    @genres = get_genres(result)
    @overview = result[:overview]
    @reviews = get_reviews(result)
  end

  def get_cast(result)
    result[:credits][:cast][0..9] unless result[:credits].nil?
  end

  def get_genres(result)
    result[:genres] unless result[:genres].nil?
  end

  def get_reviews(result)
    result[:reviews][:results] unless result[:reviews].nil?
  end
end
