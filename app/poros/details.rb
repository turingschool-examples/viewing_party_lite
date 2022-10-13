class Details
  attr_reader :title,
              :summary,
              :vote_average,
              :runtime,
              :genres

  def initialize(api)
    @title = api[:original_title]
    @summary = api[:overview]
    @vote_average = api[:vote_average]
    @runtime = api[:runtime]
    @genres = api[:genres]
  end
end
