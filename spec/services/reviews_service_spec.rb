require 'rails_helper'

RSpec.describe 'Reviews Service' do
  describe 'class methods' do

    it 'can establish connection to MovieDB API and return reviews', :vcr do

      review = ReviewsService.reviews(278)
      expect(review).to be_a(Hash)
      expect(review[:results]).to be_an(Array)
      expect(review[:results].first[:author]).to eq("elshaarawy")
      expect(review[:results].first[:content]).to eq("very good movie 9.5/10 محمد الشعراوى")
    end
  end
end
