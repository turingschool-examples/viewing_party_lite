class Movie

  attr_reader :id, :title, :overview, :poster_path, :release_date, :vote_average, :popularity

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @overview = data[:overview]
    @poster_path = data[:poster_path]
    @release_date = data[:release_date]
    @vote_average = data[:vote_average]
    @popularity = data[:popularity]
  end

end
