require 'rails_helper'

describe ReviewService do
  context "class methods" do
    context "#get_review_info(movie_id)" do
      it "returns review data from the review endpoing", :vcr do
        review_data = ReviewService.get_review_info(550)

        expect(review_data).to be_a Hash
        expect(review_data[:results]).to be_an Array

        expect(review_data[:results].first).to have_key :content
        expect(review_data[:results].first[:content]).to be_a(String)

        expect(review_data[:results].first).to have_key :author
        expect(review_data[:results].first[:author]).to be_a(String)
      end
    end
  end
end