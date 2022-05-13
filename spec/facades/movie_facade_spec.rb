require 'rails_helper'

RSpec.describe MovieFacade do
  # xit 'collects data for to_20 movies', :vcr do
  #   results = MovieFacade.top_movies_data
  #   expect(results).to be_all MovieDetail
  # end

  it 'creates 20 top movies objects' do
    data = JSON.parse(File.read('spec/fixtures/top_20.json'), symbolize_names: true)[:results]
    allow(TmdbService).to receive(:top20).and_return(data)
    results = MovieFacade.top20
    expect(results).to be_all MovieDetail
    expect(results.count).to eq(20)
  end

  it 'creates 40 movies from valid search', :vcr do
    results = MovieFacade.search('man')

    expect(results).to be_all MovieDetail

    expect(results.count).to eq(40)
  end

  it 'returns a hash of movie details, casts and reviews objects' do
    details = JSON.parse(File.read('spec/fixtures/movie_details.json'), symbolize_names: true)
    allow(TmdbService).to receive(:movie_details).and_return(details)
    cast = JSON.parse(File.read('spec/fixtures/movie_cast.json'), symbolize_names: true)
    allow(TmdbService).to receive(:movie_cast).and_return(cast)
    review = JSON.parse(File.read('spec/fixtures/movie_review.json'), symbolize_names: true)
    allow(TmdbService).to receive(:movie_review).and_return(review)
    results = MovieFacade.movie_data(545_611)

    expect(results).to be_a Hash
    expect(results[:movie_details]).to be_a MovieDetail
    expect(results[:movie_cast]).to be_all Cast
    expect(results[:movie_reviews]).to be_all Review
  end

  it 'returns movie details', :vcr do
    movie_details = MovieFacade.movie_details(438_631)

    expect(movie_details).to be_a MovieDetail
  end
  it 'returns movie cast', :vcr do
    movie_cast = MovieFacade.movie_cast(438_631)

    expect(movie_cast).to be_all Cast
  end
  it 'returns movie reviews', :vcr do
    movie_reviews = MovieFacade.movie_reviews(438_631)

    expect(movie_reviews).to be_all Review
  end
end
