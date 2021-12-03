class DetailedMovie

  attr_reader :title,
              :vote_average,
              :id,
              :runtime,
              :summary

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @id = data[:id]
    @runtime = data[:runtime]
    @summary = data[:overview]
    @genres = data[:genres]
  end

  def genre_names
    @genres.map do |genre|
      genre[:name]
    end.join(', ')
  end
end
