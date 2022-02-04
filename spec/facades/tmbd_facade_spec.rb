require 'rails_helper'

RSpec.describe TmdbFacade do
  let(:top_rated) {TmdbFacade.top_rated_movies}
  let(:keyword) {TmdbFacade.keyword("Godfather")}
  let(:reviews) {TmdbFacade.reviews(100)}
  let(:details) {TmdbFacade.details(278)}

  it 'creates top rated movies poros' do 
    expect(top_rated.first).to be_a(Movie)
  end

  it 'creates keyword movies poros' do 
    expect(keyword.first).to be_a(Movie)
  end

  it 'creates review poros' do 
    expect(reviews.first).to be_a(Review)
  end

  it 'add details to an existing movie poro' do 
    expect(details).to be_a(Movie)
  end
end