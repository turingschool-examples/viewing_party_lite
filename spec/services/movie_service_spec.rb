require 'rails_helper'

RSpec.describe MovieService do 
  let!(:response) { MovieService.popular_movies }

  it 'establishes a connection for popular movies', :vcr do 

    expect(response).to be_all(Hash)
    expect(response[0][:title]).to be_a(String)
    expect(response.length).to eq(40)
  end
end