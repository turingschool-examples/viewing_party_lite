class MovieDetail
  attr_reader :title,
              :id,
              :summary,
              :genres,
              :runtime,
              :vote_average,
              :vote_count,
              :image_url

  def initialize(response)
    @title = response[:title]
    @id = response[:id]
    @summary = response[:overview]
    @genres = response[:genres]
    @runtime = response[:runtime]
    @vote_average = response[:vote_average]
    @vote_count = response[:vote_count]
    @image_url = response[:backdrop_path]
  end
end