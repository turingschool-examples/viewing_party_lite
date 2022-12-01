class Movie
  attr_reader :id,
              :poster,
              :title,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :cast,
              :total_reviews,
              :reviews

  def initialize(details_data, reviews_data, credits_data)
    @id = details_data[:id]
    @poster = details_data[:poster_path]
    @title = details_data[:original_title]
    @vote_average = details_data[:vote_average]
    @runtime = details_data[:runtime]
    @genres = details_data[:genres].map { |genre| genre[:name] }
    @summary = details_data[:overview]
    @cast = credits_data[:cast].map { |cast_member| cast_member[:name] }.first(10)
    @characters = credits_data[:cast].map { |character| character[:character] }.first(10)
    @total_reviews = reviews_data[:total_results]
    @reviews = reviews_data[:results]
  end

  def actors_and_characters
    list = {}
    @cast.each_with_index do |actor, i|
      list[actor] = @characters[i]
    end
    list
  end
end
