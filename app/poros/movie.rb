class Movie
  attr_reader :adult,
              :backdrop_path,
              :genres,
              :id,
              :original_language,
              :original_title,
              :overview,
              :popularity,
              :poster_path,
              :release_date,
              :title,
              :video,
              :vote_average,
              :vote_count,
              :runtime,
              :cast,
              :reviews


  def initialize(data)
    @adult = data[:adult]
    @backdrop_path = data[:backdrop_path]
    @genres = data[:genres]
    @id = data[:id]
    @original_language = data[:original_language]
    @original_title = data[:original_title]
    @overview = data[:overview]
    @popularity = data[:popularity]
    @poster_path = data[:poster_path]
    @release_date = data[:release_date]
    @title = data[:title]
    @video = data[:video]
    @vote_average = data[:vote_average]
    @vote_count = data[:vote_count]
    @runtime = data[:runtime]
    @cast = MovieSearch.new.get_credits(@id)
    @reviews = MovieSearch.new.get_reviews(@id)
  end

  def time_conversion
    hours = @runtime / 60
    rest = @runtime % 60
    "#{hours}:#{rest}"
  end

  def genre_names
    @genres.map { |genre| genre[:name] }
  end
end
