require "rails_helper"

describe MovieFacade do
  context "class methods" do
    context "#search_results" do
      it "returns a max of 40 movie poros", :vcr do
        results = MovieFacade.search_results("the")
        expect(results.first).to be_a Movie
        expect(results.length).to eq(40)
      end
    end

    context "#top_20" do
      it "returns top 20 movie poros", :vcr do
        results = MovieFacade.top_20
        expect(results.first).to be_a Movie
        expect(results.length).to eq(20)
      end
    end
  end
end
