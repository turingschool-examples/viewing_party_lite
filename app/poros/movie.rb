class Movie
  attr_reader :id, 
              :original_title, 
              :runtime,
              :vote_count,
              :vote_average,
              :overview,
              :image

    def initialize(data)
      @id = data[:id]
      @original_title = data[:original_title]
      @runtime = data[:runtime]
      @vote_count = data[:vote_count]
      @vote_average = data[:vote_average]
      @overview = data[:overview]
      @image = "https://image.tmdb.org/t/p/w185/#{data[:poster_path]}"
    end
  
end