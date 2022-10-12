class Movie
    attr_reader :title,
                :vote_average,
                :id
    def initialize(attributes)
        @title = attributes[:title]
        @id = attributes[:id]
        @vote_average = attributes[:vote_average]
    end
end