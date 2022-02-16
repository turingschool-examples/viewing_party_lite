require 'rails_helper'

RSpec.describe Review do
  let(:review) { TmdbFacade.reviews(278) }

  it 'attributes', :vcr do
    expect(review.sample.author).to be_a(String)
    expect(review.sample.summary).to be_a(String)
  end
end
