require 'rails_helper' 

RSpec.describe 'MovieService' do 
  it 'retrieves top rated movies', :vcr do 
    parsed_json = MovieService.top_rated

    expect(parsed_json).to be_a Hash 
    expect(parsed_json[:results]).to be_a Array 

    top_movie = parsed_json[:results][0]
    expect(top_movie).to include(:id, :title, :vote_average)
    expect(top_movie[:id]).to be_a Integer 
    expect(top_movie[:title]).to be_a String
    expect(top_movie[:vote_average]).to be_a Float
  end
end