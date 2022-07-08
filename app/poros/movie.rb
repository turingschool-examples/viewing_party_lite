class Movie

  attr_reader :data,
              :title,
              :id,
              :original_title,
              :overview,
              :runtime,
              :vote_average,
              :vote_count

  def initialize(data)
    @data = data
    @title = data[:title]
    @id = data[:id]
    @original_title = data[:original_title]
    @overview = data[:overview]
    @runtime = data[:runtime]
    @vote_average = data[:vote_average]
    @vote_count = data[:vote_count]
    # not sure what to do with genre, yet. the json shows multiple values
    # need to account for cast, reviewers
  end
end
