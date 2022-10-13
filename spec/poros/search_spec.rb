require 'rails_helper'

RSpec.describe Search do
  describe 'Search Poro', :vcr do
    before :each do
      @search_1 = MovieFacade.search_poro("Dark")
      @search_2 = MovieFacade.search_poro("Fight")
    end

    it 'instantiates' do
      expect(@search_1).to be_a(Search)
    end

    it 'results instance variable returns an array of hashes, genre id is array' do
      expect(@search_1.search_results).to be_a(Array)
      expect(@search_1.search_results[0]).to be_a(Hash)
      expect(@search_1.search_results[0][:genre_ids]).to be_a(Array)
    end

    it 'search results include keyword' do
      expect(@search_1.search_results[0][:title]).to include("Dark")
    end
  end

  describe 'Search Poro 2', :vcr do
    before :each do
     @search_2 = MovieFacade.search_poro("Fight")
    end

    it 'results instance variable returns an array of hashes, genre id is array' do
      expect(@search_2.search_results).to be_a(Array)
      expect(@search_2.search_results[0]).to be_a(Hash)
      expect(@search_2.search_results[0][:genre_ids]).to be_a(Array)
    end

    it 'search results include keyword' do
      expect(@search_2.search_results[0][:title]).to include("Fight")
      
    end
  end
end