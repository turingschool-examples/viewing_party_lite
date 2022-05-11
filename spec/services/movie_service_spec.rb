require "rails_helper"

describe MovieService do
  context "class methods" do
    context "#top_20" do
      it "lists 20 movies", :vcr do
        top_twenty = MovieService.top_20

        expect(top_twenty).to be_a Hash
        expect(top_twenty[:results]).to be_an Array
        expect(top_twenty[:results].first).to be_a Hash

        expect(top_twenty[:results].length).to eq(20)
      end
    end

    context "#search" do
      it "lists movies with similar names" do
        the = MovieService.search("the")

        expect(the).to be_a Hash
        expect(the[:results]).to be_an Array
        expect(the[:results].first).to be_a Hash

        expect(the[:results].first[:title]).to include("the")
      end
    end
  end
end
