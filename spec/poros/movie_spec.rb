# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    
    attributes = JSON.parse(File.read("./spec/fixtures/movie_details.json"), symbolize_names: true)
    movie = Movie.new(attributes)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("The Lord of the Rings: The Fellowship of the Ring")
    expect(movie.id).to eq(120)
    expect(movie.vote_average).to eq(8.4)
    expect(movie.runtime).to eq('2hr 59 min')
    expect(movie.runtime_mins).to eq(179)
    expect(movie.genres).to be_a(Array)
    expect(movie.reviews).to be_a(Array)
    expect(movie.overview).to be_a(String)
    expect(movie.cast).to be_a(Array)
    expect(movie.image_uri).to eq("/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg")
  end
end
