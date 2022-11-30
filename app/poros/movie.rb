class Movie
  attr_reader :adult,
              :backdrop_path,
              :genre_ids,
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
              :vote_count

  def initialize(data)
    @adult = data[:adult]
    @backdrop_path = data[:backdrop_path]
    @genre_ids = data[:genre_ids]
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
    @vote_coun = data[:vote_coun]
  end
end
