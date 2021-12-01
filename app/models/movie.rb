class Movie
  attr_reader :title,
              :id,
              :vote_average,
              :genres,
              :poster,
              :runtime,
              :overview

  def initialize(movie)
    @title = movie[:title]
    @id = movie[:id]
    @vote_average = movie[:vote_average]
    @genres = if movie[:genres].present?
                movie[:genres].pluck(:name)
              end
    @poster = if movie[:poster_path].present?
                "https://image.tmdb.org/t/p/w500/#{movie[:poster_path]}"
              end
    @runtime = if movie[:runtime].present?
                movie[:runtime]
              end
    @overview = if movie[:overview].present?
                movie[:overview]
              end
    # @reviews = if movie[:overview].present?
    #             movie[:overview]
    #           end
  end

  def runtime_in_minutes
    if (runtime / 60).floor > 1
      "#{(runtime / 60).floor} hrs #{@runtime % 60} min"
    else
      "#{(runtime / 60).floor} hr #{@runtime % 60} min"
    end
  end
end
