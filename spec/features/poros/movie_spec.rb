require 'rails_helper'

RSpec.describe Movie do
	before :each do
		@movie1 = Movie.new(title: "Gnomes", image_path: 'example/path', vote_average: 7.7)
	end

	it "exists" do
		expect(@movie1).to be_a(Movie)
	end

	it "has attributes" do
		expect(@movie1.title).to eq("Gnomes")
		expect(@movie1.image_path).to eq("example/path")
		expect(@movie1.vote_average).to eq(7.7)
  end
end
