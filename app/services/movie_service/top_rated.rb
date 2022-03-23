module MovieService
  class TopRated
    attr_reader :movie_client, :movie_rep

    def initialize(movie_client: MovieClient, movie_rep: MovieRep)
      @movie_client = movie_client
      @movie_rep = movie_rep
    end

    def self.call
      new.call
    end

    def call
      movie_client.call(:top_rated)[:results].map do |result|
        movie_rep.new(result)
      end
    end
  end
end
