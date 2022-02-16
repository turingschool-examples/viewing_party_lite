require 'rails_helper'

RSpec.describe TmdbFacade do
  let(:top_rated) { TmdbFacade.top_rated_movies }
  let(:keyword) { TmdbFacade.keyword('Godfather') }
  let(:reviews) { TmdbFacade.reviews(100) }
  let(:details) { TmdbFacade.details(278) }

  it 'creates top rated movies poros', :vcr do
    expect(top_rated.first).to be_a(Movie)
  end

  it 'creates keyword movies poros', :vcr do
    expect(keyword.first).to be_a(Movie)
  end

  it 'creates review poros', :vcr do
    expect(reviews.first).to be_a(Review)
  end

  it 'add details to an existing movie poro', :vcr do
    expect(details).to be_a(Movie)
  end
end
