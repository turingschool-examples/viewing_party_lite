class Movie 
    attr_reader :title, :vote_average, :id, :duration, :movie_image, :genres, :overview, :cast, :release_date

    def initialize(data)
        @id = data[:id]
        @title = data[:title]
        @duration = data[:runtime]
        @movie_image = data[:poster_path]
        @vote_average = data[:vote_average]
        @genres = data[:genres]
        @overview = data[:overview]
        @cast = data[:cast]
        @release_date = data[:date]
    end 
end 