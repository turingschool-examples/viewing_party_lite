require 'rails_helper'

RSpec.describe "Review" do
  describe "exists" do
    it 'exists and has attributes' do
      fight_club = File.read("spec/fixtures/fight_club.json")
      fc = JSON.parse(fight_club, symbolize_names: true)

      first_review = Review.new(fc[:reviews][:results].first)

      expect(first_review).to be_a Review
      expect(first_review.author).to be_a String
      expect(first_review.content).to be_a String
    end
  end
end