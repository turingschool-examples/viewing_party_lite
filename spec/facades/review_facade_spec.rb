require "rails_helper"

describe ReviewFacade do
  context "#reviews" do
      it "returns movie reviews", :vcr do
        results = ReviewFacade.reviews(100)
        expect(results.first).to be_a Review
        expect(results.first.author).to eq("BradFlix")
        expect(results.first.content).to eq("I just plain love this movie!")
      end
    end
end
