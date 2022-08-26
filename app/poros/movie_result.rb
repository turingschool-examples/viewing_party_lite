class MovieResult
  attr_reader :title,
              :vote_average,
              :id,
              :runtime,
              :genre,
              :overview,
              :poster_path

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average].round(1)
    @id = data[:id]
    @runtime = data[:runtime]
    @genre = data[:genres].collect {|genre| genre[:name]}
    @overview = data[:overview]
    @poster_path = data[:poster_path]
  end
end
