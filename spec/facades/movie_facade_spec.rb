require 'rails_helper'

RSpec.describe 'Movie Facade' do
  it 'creates top rated movies', :vcr do
    top_rated_movies = MovieFacade.create_top_rated

    expect(top_rated_movies[0]).to be_an_instance_of(Movie)
  end

  it 'creates movies from search', :vcr do
    movies = MovieFacade.create_searched('Avatar')

    expect(movies[0]).to be_an_instance_of(Movie)
  end

  it 'creates movie', :vcr do
    movie = MovieFacade.create_movie(550)

    expect(movie).to be_an_instance_of(Movie)
  end

  it 'creates cast members', :vcr do
    cast_members = MovieFacade.create_cast_members(550)

    expect(cast_members[0]).to be_an_instance_of(CastMember)
    expect(cast_members.count).to eq(10)
  end

  it 'creates reviews', :vcr do
    reviews = MovieFacade.create_reviews(550)

    expect(reviews).to be_an_instance_of(Reviews)
  end
end
