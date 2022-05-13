class MovieInfo
  attr_reader :id, :title, :vote_average, :summary, :genre, :poster, :runtime, :cast_members, :reviews

  def initialize(production, cast, reviews, pictures)
    @id = production[:id]
    @title = production[:title]
    @vote_average = production[:vote_average]
    @summary = production[:overview]
    @genre = genre_definer(genres)
    @poster = picture_finder(poster)
    @runtime = production[:runtime]
    @cast_members = crew(cast)
    @reviews = review(content)
  end

  def genre_definer(genres)
    genres = []
    production[:genres].each do |genre|
      genres << genre[:name]
    end
    genres
  end

  def crew(cast)
    cast_hash = {}
    cast[:cast].first(10).each do |member|
      cast_hash[member[:name]] = member[:character]
    end
    cast_hash
  end

  def review(content)
    review_hash = {}
    # review_counter = []
    reviews[:results].each do |review|
      review_hash[review[:author]] = review[:content]
    end
    review_hash
  end

  def picture_finder(poster)
    "https://image.tmdb.org/t/p/w200#{poster[:logos].first[:file_path]}"
  end
end
