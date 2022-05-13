# frozen_string_literal: true

class Movie
  attr_reader :id, :title, :vote_average, :poster_path, :runtime,
              :runtime_mins, :overview, :cast, :genres, :reviews

  def initialize(details, credits = [], reviews = [])
    @id = details[:id]
    @title = details[:title]
    @vote_average = details[:vote_average]
    @poster_path = details[:poster_path]
    @runtime = formatted_duration(details[:runtime].to_i)
    @runtime_mins = details[:runtime]
    @overview = details[:overview]
    @genres = details[:genres]
    @cast = credits[0..9]
    @reviews = reviews
  end

  def formatted_duration(total_minute)
    "#{total_minute / 60} hours #{total_minute % 60} minutes"
  end
end
