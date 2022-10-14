class Details
  attr_reader :title,
              :summary,
              :vote_average,
              :runtime,
              :genres,
              :id

  def initialize(api)
    @id = api[:id]
    @title = api[:original_title]
    @summary = api[:overview]
    @vote_average = api[:vote_average]
    @runtime = api[:runtime]
    @genres = api[:genres]
  end

  def genres_names_array
    @genres.map do |genre|
      genre[:name]
    end
  end
end
