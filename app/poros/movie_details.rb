class MovieDetails
    attr_reader :title, :id, :genres, :vote_average, :runtime, :summary, :poster

    def initialize(data)
        @title = data[:title]
        @id = data[:id]
        @genres = genre_grab(data[:genres])
        @vote_average = data[:vote_average]
        @runtime = data[:runtime]
        @summary = data[:overview]
        @poster = data[:poster_path]
    end

    def genre_grab(genres)
        genres.map { |genre| genre[:name]}
    end
end