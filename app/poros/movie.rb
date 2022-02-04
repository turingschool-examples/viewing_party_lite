require 'pry'

class Movie 
  attr_reader :id, 
              :title, 
              :summary, 
              :vote_average,
              :vote_count,
              :poster_path, 
              :total_min, 
              :cast, 
              :genres, 
              :reviews, 
              :runtime

  def initialize(data)
    @id           = data[:id]
    @title        = data[:title]
    @summary      = data[:overview]
    @vote_average = data[:vote_average]
    @vote_count   = data[:vote_count]
    @poster_path  = data[:poster_path]
    @total_min    = nil
    @runtime      = nil
    @cast         = nil
    @genres       = nil
  end

  def add_generes(data)
    @genres = data[:genres].map {|genre| genre[:name]}
  end

  def add_length(data)
    @total_min = data[:runtime]
  end

  def add_runtime(data)
    @runtime = "#{data[:runtime] / 60}hr #{data[:runtime] % 60} min"
  end

  def add_cast(data)
    cast_characters = Hash.new 
    data.each do |cast_member|
      cast_characters[cast_member[:name]] = cast_member[:character]
    end
    @cast = cast_characters
  end
end