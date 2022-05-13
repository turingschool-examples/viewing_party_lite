require 'rails_helper'


RSpec.describe MovieService do
  describe "API endpoints" do
    it 'Gets data from top rated api', :vcr do
      json = MovieService.get_top_rated
      expect(json).to have_key(:results)
    end

    it 'Gets data from movie details api', :vcr do
      json = MovieService.get_top_rated
      expect(json).to have_key(:results)
    end
  end
end
