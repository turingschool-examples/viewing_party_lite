class Movie
  attr_reader :title, 
                    :id, 
                    :vote_average, 
                    :runtime,
                    :genres,
                    :overview

  def initialize(info)
    @title = info[:title]
    @id = info[:id]
    @vote_average = info[:vote_average]
    @runtime = duration(info[:runtime])
    @genres = info[:genres]
    @overview = info[:overview]
  end

  def duration(minutes)
    "#{minutes / 60 } h #{minutes % 60} m"
  end
end
