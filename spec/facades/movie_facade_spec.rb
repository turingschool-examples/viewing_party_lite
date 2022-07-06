require 'rails_helper'

RSpec.describe MovieFacade do
  describe "top rated movies" do
    it "can return the top rated movies", :vcr do
      movies = MovieFacade.top_rated
      expect(movies).to be_a(Array)
      expect(movies).to be_all Movie
    end
  end
end
