class MovieDetail

  attr_reader :title, :runtime, :vote, :summary, :id

  def initialize(attributes)
    @title = attributes[:original_title]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @vote = attributes[:vote_average]
    @summary = attributes[:overview]
    @id = attributes[:id]
  end

  def all_genere_names
    names = []
    @genres.map do |genre|
      genre[:name]
    end
  end
end
