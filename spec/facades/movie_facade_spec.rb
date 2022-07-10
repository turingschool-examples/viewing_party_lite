require 'rails_helper'

RSpec.describe 'MovieFacade' do
  describe 'discover page calls' do
    it 'returns an array of up to 40 top rated movie hashes after service call #get_top_rated', :vcr do 
     results = MoviesFacade.top_rated  #set to variable to decrease number of api and/or cassette calls
      expect(results).to be_a Array
      expect(results.count).to be <= 40
      expect(results).to be_all Movie 
    end

    it 'key word search returns an array of up to 40 movie hashes with keyword in the title', :vcr do
      keyword = "Home"
      results = MoviesFacade.search(keyword)  #set to variable to decrease number of api and/or cassette calls
      expect(results).to be_a Array
      expect(results.sample.title).to include('Home')
      expect(results.count).to be <= 40
    end
  end
end