require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
      attributes = {
        title: "The Best Movie Ever",
        id: "1",
        vote_average: "4.6",
        genres: "Action",
        poster_path: "/cVn8E3Fxbi8HzYYtaSfsblYC4gl.jpg",
        runtime: "120",
        overview: "This is a movie about being the best movie ever."
      }

      movie = Movie.new(attributes)

      expect(movie).to be_an_instance_of(Movie)
      expect(movie.title).to eq("The Best Movie Ever")
      expect(movie.id).to eq("1")
      expect(movie.vote_average).to eq("4.6")
      expect(movie.genres).to eq("Action")
      expect(movie.poster_path).to eq("/cVn8E3Fxbi8HzYYtaSfsblYC4gl.jpg")
      expect(movie.runtime).to eq("120")
      expect(movie.overview).to eq("This is a movie about being the best movie ever.")
  end
end
