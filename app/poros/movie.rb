class Movie

  attr_reader :data,
              :title,
              :id,
              :original_title,
              :overview,
              :runtime,
              :vote_average,
              :vote_count,
              :genres,
              :cast

  def initialize(data)
    @data = data
    @title = data[:title]
    @id = data[:id]
    @original_title = data[:original_title]
    @overview = data[:overview]
    @runtime = data[:runtime]
    @vote_average = data[:vote_average]
    @vote_count = data[:vote_count]
    @genres = data[:genres]
    @cast = data[:cast]
  end

  def format_runtime(runtime)
    hour = runtime / 60
    minute = runtime % 60
    "#{hour}:#{minute}"
  end
end
