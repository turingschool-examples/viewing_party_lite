class MovieDetails
  attr_reader :title,
              :vote_average,
              :genre,
              :runtime,
              :summary,
              :cast_members,
              :total_reviews,
              :author,
              :id,
              :image

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @genre = data[:genres].map {|genre| genre[:name]}
    @runtime = data[:runtime]
    @summary = data[:overview]
    @cast_members = data[:credits][:cast][(0..9)]
    @total_reviews = data[:reviews][:total_results]
    @author = data[:reviews][:results].map {|author| author[:author_details]}
    @image = data[:poster_path]
  end

  def time_conversion(runtime)
    hours = runtime / 60
    minutes = runtime % 60
    "#{hours}:#{minutes}"
  end
end
