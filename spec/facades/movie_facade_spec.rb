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
end
