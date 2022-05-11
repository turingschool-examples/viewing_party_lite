require "rails_helper"

RSpec.describe "Movie Service" do
  it "returns top movies" do
    response = MovieService.get_top_movies

    expect(response).to be_an(Array)
    expect(response.count).to eq(40)
    expect(response.first[:title]).to eq("The Shawshank Redemption")
  end
end
