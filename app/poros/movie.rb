class Movie
  attr_reader :title,
              :vote_average,
              :runtime,
              :genre,
              :summary_description,
              :movie_id,
              :minutes

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = (time_conversion(data[:runtime]) if data[:runtime])
    @minutes = data[:runtime]
    @genre = data[:genres][0][:name] if data[:genres]
    @summary_description = data[:overview]
    @movie_id = data[:id]
  end

  def time_conversion(minutes)
    hours = minutes / 60
    rest = minutes % 60
    "#{hours}:#{rest}"
  end
end
