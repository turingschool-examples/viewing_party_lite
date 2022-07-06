require 'rails_helper'

RSpec.describe MovieService do
  describe "top rated movies endpoint" do
    it "gets the top rated movies from this endpoint", :vcr do
      json = MovieService.get_top_rated_movies
      expect(json[0]).to have_key(:title)
    end
  end
end
