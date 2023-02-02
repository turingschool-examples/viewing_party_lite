class Movie

  include ActiveModel::Model

  attr_reader :movie_id,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary

  def initialize(data)
    @movie_id     = data[:id]
    @title        = data[:title]
    @vote_average = data[:vote_average]
    @runtime      = convert_runtime(data[:runtime])
    @genres       = data[:genres]
    @summary      = data[:overview]
  end

  def convert_runtime(runtime)
    "#{runtime / 60}hr #{runtime % 60}min"
  end

  def persisted?
    false
  end
end