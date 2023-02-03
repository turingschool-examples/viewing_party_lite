require 'rails_helper'

RSpec.describe ReviewFacade do
  it 'can return a collection of review objects' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/348/reviews?api_key=#{ENV['tmdb_api_key']}&language=en")
    .to_return(status: 200,
              body: File.read('spec/fixtures/alien_reviews.json'),
              headers: {})

    reviews = ReviewFacade.get(348)

    expect(reviews).to be_a Array
    reviews.each do |review|
      expect(review).to be_a Review
    end
  end
end
