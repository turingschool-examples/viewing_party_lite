require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'instantiates top rated poro', :vcr do
    it 'instantiates' do
      top_rated = MovieFacade.top_rated_poro
      expect(top_rated).to be_a(MoviesTopRated)
    end
  end

  describe 'instantiates credits poro', :vcr do
    it 'instantiates' do
      credits = MovieFacade.credits_poro(550)
      expect(credits).to be_a(Credits)
    end
  end

  describe 'instantiates reviews poro', :vcr do
    it 'instantiates' do
      reviews = MovieFacade.reviews_poro(550)
      expect(reviews).to be_a(Reviews)
    end
  end

  describe 'instantiates details poro', :vcr do
    it 'instantiates' do
      details = MovieFacade.details_poro(550)
      expect(details).to be_a(Details)
    end
  end

  describe 'instantiates search poro', :vcr do
    it 'instantiates' do
      search = MovieFacade.search_poro('Dark')
      expect(search).to be_a(Search)
    end
  end
end
