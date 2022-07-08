require 'rails_helper'

RSpec.describe MovieService do 
  let!(:pop_response) { MovieService.popular_movies }
  let!(:search_response) { MovieService.find_movies("Doctor Strange") }

  it 'establishes a connection for popular movies', :vcr do 

    expect(pop_response).to be_all(Hash)
    expect(pop_response[0][:title]).to be_a(String)
    expect(pop_response.length).to eq(40)
  end

  it 'establishes connection for movie search', :vcr do

    expect(search_response).to be_all(Hash)
    expect(search_response[0][:title]).to be_a(String)
    expect(search_response.length).to eq(10)
  end 
end