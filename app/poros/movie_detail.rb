class MovieDetail
  attr_reader :title, :runtime, :vote, :summary

  def initialize(attributes)
    @title = attributes[:original_title]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @vote = attributes[:vote_average]
    @summary = attributes[:overview]
  end

  def all_genere_names
    @genres.each do |genre|
      genre[:name]
    end
  end
end
