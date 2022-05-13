class Movie
  attr_reader :title, :vote_average, :id, :cast, :runtime, :genres, :summary, :reviews

  def initialize(movie_data)
    @title = movie_data[:title]
    @vote_average = movie_data[:vote_average]
    @id = movie_data[:id]
    @cast = get_cast(movie_data)
    @runtime = movie_data[:runtime]
    @genres = get_genres(movie_data)
    @summary = movie_data[:overview]
    @reviews = get_reviews(movie_data)
    # default_unavailable
  end

  def get_cast(movie_data)
    if !movie_data[:credits].nil?
      movie_data[:credits][:cast][0..9]
    end
  end

  def get_genres(movie_data)
    if !movie_data[:genres].nil?
      movie_data[:genres].map {|g| g[:name]}
    end
  end

  def get_reviews(movie_data)
    if !movie_data[:reviews].nil?
      movie_data[:reviews][:results]
    end
  end

  def runtime_with_hours
    hours = @runtime / 60
    minutes = @runtime.modulo(60)
    if hours == 1
      "#{hours} hour #{minutes} minutes"
    else
      "#{hours} hours #{minutes} minutes"
    end
  end

  # def default_unavailable
  #   variables = [@title, @vote_average, @id, @cast, @runtime, @genres, @summary, @reviews]
  #   variables.each do |var|
  #     if var == nil
  #       require "pry"; binding.pry
  #       var = "N/A"
  #     end
  #   end
  #   # instance_variables.each do |var|
  #   # end
  # end
end
