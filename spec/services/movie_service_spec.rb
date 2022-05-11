require "rails_helper"

RSpec.describe "Movie Service" do
  it "returns top movies" do
    response = MovieService.get_top_movies

    expect(response).to be_an(Array)
  end
end
