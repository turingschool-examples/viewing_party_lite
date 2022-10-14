require 'rails_helper'

RSpec.describe MovieFacade do
  it 'can retrieve movie_data', :vcr do
    movie_data = MovieFacade.movie_data(8)

    expect(movie_data).to be_a(MovieInfo)
  end

  it 'can retrieve top_rated movies', :vcr do
    top_20 = MovieFacade.top_rated

    expect(top_20.count).to eq(20)
  end

  it 'can retrieve movies_search with keyword', :vcr do
    results = MovieFacade.movies_search('Miss Congeniality')

    expect(results[0].title).to eq('Miss Congeniality')
  end

  it 'can retrieve cast_data', :vcr do
    cast_data = MovieFacade.cast_data(271_110)

    expect(cast_data).to be_a(Array)
    expect(cast_data.count).to eq 10
    expect(cast_data[0]).to be_instance_of(Cast)
  end

  it 'can retrieve review_data', :vcr do
    review_data = MovieFacade.review_data(271_110)

    expect(review_data).to be_a(Array)
    expect(review_data[0]).to be_instance_of(Reviews)
  end
end
