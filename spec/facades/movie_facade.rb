require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'top_rated' do
    before :each do
      @top_rated = MovieFacade.top_rated
    end

    it 'returns an array', :vcr do
      expect(@top_rated).to be_a Array
    end

    it 'contains movie objects', :vcr do
      expect(@top_rated.first).to be_a Movie
    end
  end
end
