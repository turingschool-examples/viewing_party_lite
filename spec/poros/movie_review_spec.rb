require 'rails_helper'

RSpec.describe MovieReview do 
  before :each do 
    response = File.read('./spec/fixtures/godfather/reviews_response.json')
    @data = JSON.parse(response, symbolize_names: true)
  end 

  it 'exists and has attributes' do 
    movie = MovieReview.new(@data)

    expect(movie).to be_an_instance_of(MovieReview)
    expect(movie.results.first[:author]).to eq("futuretv")
    expect(movie.results.first[:content]).to include("The Godfather Review by Al Carlson")
    expect(movie.total_results).to eq(2)
  end

  describe 'review_with_author' do 
    xit 'returns the author and the review' do 
      movie = MovieReview.new(@data)

    end
  end
end 