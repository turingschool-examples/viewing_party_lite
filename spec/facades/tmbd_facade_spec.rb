require 'rails_helper'

RSpec.describe TmdbFacade do
  it 'creates review poros' do 
    reviews = TmdbFacade.reviews(100)

    expect(reviews.first).to be_a(Review)
  end
end