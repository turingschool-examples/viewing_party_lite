class MovieData
  attr_reader :id, :title, :genres, :overview, :cast, :reviews, :runtime, :vote_avg

  def initialize(production, cast, reviews)
    @id = production[:id]
    @title = production[:title]
    @genres = set_genres(production)
    @overview = production[:overview]
    @cast = performers(cast)
    @reviews = review(reviews)
    @runtime = production[:runtime]
    @vote_avg = production[:vote_average]
  end

  def set_genres(production)
    genre_names = []
    production[:genres].each do |genre|
      genre_names << genre[:name]
    end
    genre_names
  end

  def performers(cast)
    hash = {}
    cast[:cast].first(10).each do |actor|
      hash[actor[:name]] = actor[:character]
    end
    hash
  end

  def review(reviews)
    hash = {}
      reviews[:results].each do |review|
        hash[review[:author]] = review[:content]
      end
      hash

  end


end
