# frozen_string_literal: true

class MovieDetails

  attr_reader :movie_id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :poster

  def initialize(data)
    @movie_id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average].round(1) if data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @summary = data[:overview]
    @poster = data[:poster_path]
  end

  def format_runtime
    if runtime
      hour = runtime / 60
      min = runtime % 60
      "#{hour} hrs #{min} min"
    end
  end

  def format_genres
    if genres
      genres.map { |genre| genre[:name] }
    else
      []
    end
  end
end
