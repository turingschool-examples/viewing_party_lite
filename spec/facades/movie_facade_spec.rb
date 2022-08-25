require 'rails_helper' 

RSpec.describe 'MovieFacade' do 
  it 'returns an array of top Movies', :vcr do 
    movies = MovieFacade.get_top_rated
    expect(movies).to be_a Array 
    expect(movies).to be_all TopMovie
  end
end