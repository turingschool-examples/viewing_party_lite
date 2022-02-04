require 'pry'

class Movie 
  attr_reader :id, 
              :title, 
              :summary, 
              :vote_average,
              :vote_count,
              :poster_path, 
              :length, 
              :cast, 
              :genres, 
              :reviews

  def initialize(data)
    @id           = data[:id]
    @title        = data[:title]
    @summary      = data[:overview]
    @vote_average = data[:vote_average]
    @vote_count   = data[:vote_count]
    @poster_path  = data[:poster_path]
    @length       = nil
    @cast         = nil
    @genres       = nil
  end

  def add_generes(data)
    @genres = data[:genres].map {|genre| genre[:name]}
  end

  def add_length(data)
    @length = data[:runtime]
  end

  def add_cast(data)
    cast_characters = Hash.new 
    data.each do |cast_member|
      cast_characters[cast_member[:name]] = cast_member[:character]
    end
    @cast = cast_characters
  end
end