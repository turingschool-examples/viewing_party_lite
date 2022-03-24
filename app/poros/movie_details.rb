class MovieDetails
  attr_reader :title,
              :genres,
              :run_time,
              :summary,
              :vote_average

  def initialize(data)
    @title = data[:title]
    @genres = data[:genres]
    @run_time = data[:runtime]
    @summary = data[:overview]
    @vote_average = data[:vote_average]
  end

  def get_genres
    @genres.map do |genre|
      genre[:name]
    end
  end

  def format_time
    "#{@run_time / 60}hr #{@run_time % 60} min"
  end
end
