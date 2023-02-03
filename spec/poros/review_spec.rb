require 'rails_helper'
require './app/services/movie_service'

RSpec.describe Review do
  before(:each) do
    json_response = File.read('spec/fixtures/reviews.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response, headers: {})
      
    @review= Review.new(JSON.parse(json_response, symbolize_names: true))
    # binding.pry
  end
  
  it 'exists and has attributes' do
    expect(@review).to be_a(Review)
    expect(@review.id).to eq(238)
    # binding.pry
    expect(@review.id).to eq("5346fa840e0a265ffa001e20")
    expect(@review.author).to eq("futuretv")
    expect(@review.content).to be_a(String)
  end
end