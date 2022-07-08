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
              :cast,
              :author,
              :content

  def initialize(data)
    @data = data
    @title = data[:title]
    @id = data[:id]
    @original_title = data[:original_title]
    @overview = data[:overview]
    @runtime = data[:runtime]
    @vote_average = data[:vote_average]
    @vote_count = data[:vote_count]
    @genres = data[:genre]
    @cast = data[:cast]
    @author = data[:author]
    @content = data[:content]
  end
end
