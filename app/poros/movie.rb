class Movie 
  attr_reader :title,
              :average_votes,
              :id,
              :poster_path,
              :runtime,
              :genres,
              :overview

  def initialize(data)
    @title = data[:title]
    @average_votes = data[:vote_average]
    @id = data[:id]
    @poster_path = "https://image.tmdb.org/t/p/w200#{data[:poster_path]}"
    @runtime = data[:runtime]
    @genres = extract_genres(data)
    @overview = data[:overview]
  end

  private

  def extract_genres(data)
    if data[:genres].nil?
      nil
    else
      data[:genres].map { |genre| genre[:name] }
    end
  end
end
