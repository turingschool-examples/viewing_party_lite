class MovieResults
  attr_reader :title,
              :vote_avg,
              :id,
              :runtime,
              :genres,
              :summary,
              :vote_count
  def initialize(movie)
    @title = movie[:title]
    @vote_avg = movie[:vote_average]
    @id = movie[:id]
    @runtime = movie[:runtime]
    @genres = movie[:genres]
    @summary = movie[:overview]
    @review_count = movie[:vote_count]
  end

  def time_conversion
    hours = runtime / 60
    rest = runtime % 60
    "#{hours}hr #{rest}min" 
  end

  def all_genres
    list = @genres.map do |genre|
      genre[:name]
    end
    list.join(", ") 
  end
end