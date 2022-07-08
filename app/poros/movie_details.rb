class MovieDetails
    attr_reader :title, :id, :genres, :vote_average, :runtime, :summary

    def initialize(data)
        @title = data[:title]
        @id = data[:id]
        @genres = genre_grab(data[:genres])
        @vote_average = data[:vote_average]
        @runtime = data[:runtime]
        @summary = data[:overview]
    end

    def genre_grab(genres)
        genres.map { |genre| genre[:name]}
    end
end