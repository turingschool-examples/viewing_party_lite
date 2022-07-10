require "rails_helper"

RSpec.describe MovieService do
  it "returns movie information" do
    result = MovieService.movie_data(296)

    expect(result[:title]).to eq("Terminator 3: Rise of the Machines")
    expect(result[:vote_average]).to eq(6.1)
    expect(result[:id]).to eq(296)
    expect(result[:runtime]).to eq(109)
    expect(result[:genres]).to be_a(Array)
    expect(result[:reviews]).to be_a(Hash)
  end

  it "can find movies" do
    result = MovieService.find_movies("Titanic", 1)

    expect(result[:results].first[:title]).to eq("Titanic 666")
    expect(result[:results].last[:title]).to eq("Titanic")
    expect(result[:results].last[:vote_average]).to eq(7)
    expect(result[:results].last[:id]).to eq(357517)
  end

  it "can find the top rated movies" do
    result = MovieService.get_top_rated(1)

    expect(result).to be_a(Hash)
    expect(result[:results].first[:title]).to eq("The Shawshank Redemption")
    expect(result[:results].last[:title]).to eq("The Good, the Bad and the Ugly")
    expect(result[:results].last[:vote_average]).to eq(8.5)
    expect(result[:results].last[:id]).to eq(429)
  end
end
