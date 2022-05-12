class Movie
    attr_reader :title, :vote_average

    def initialize(data)
      @title = data[:original_title]
      @vote_average = data[:vote_average]
    end
end
