require 'rails_helper'
require './app/services/movie_service'
require './app/poros/review'

RSpec.describe Review do
  before(:each) do
    json_response = File.read('spec/fixtures/reviews.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response, headers: {})
      
      @review1 = MovieFacade.reviews('238').first
  end
  
  it 'exists and has attributes' do
    expect(@review1).to be_a(Review)
    expect(@review1.review_id).to eq("5346fa840e0a265ffa001e20")
    expect(@review1.author).to eq("futuretv")
    expect(@review1.content).to be_a(String)
  end
end