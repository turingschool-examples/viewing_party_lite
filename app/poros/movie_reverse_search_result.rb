class MovieReverseSearchResult
    attr_reader :id, :poster_path

    def initialize(data)
        @id = data[0]
        @poster_path = data[1]
    end 

end 