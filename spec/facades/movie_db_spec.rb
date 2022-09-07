require 'rails_helper'

RSpec.describe MovieDBFacade do
  it 'returns an array of objects', :vcr do
    array_of_top_movie_objects = MovieDBFacade.top_movies

    expect(array_of_top_movie_objects).to be_a Array
    expect(array_of_top_movie_objects).to be_all TopMovie
  end

  it 'returns an array of objects containing the searched word(s)', :vcr do
    array_of_movies_matching_searched_keyword = MovieDBFacade.searched_movies("Shawshank")

    expect(array_of_movies_matching_searched_keyword).to be_a Array
    expect(array_of_movies_matching_searched_keyword).to be_all SearchedMovie
  end

  it "can return a movie by ID", :vcr do
    movie_id = 550
    expect(MovieDBFacade.movie(movie_id).title).to eq('Fight Club')
  end

  it "returns and array of cast members not exceeding 10", :vcr do
    movie_id = 18
    expect(MovieDBFacade.cast_members(movie_id)).to be_a(Array)
    expect(MovieDBFacade.cast_members(movie_id)[0].name).to eq('Bruce Willis')
    expect(MovieDBFacade.cast_members(movie_id)[1].name).to eq('Milla Jovovich')
  end

  it "can return an array of movie reviews", :vcr do
    movie_id = 550
    expect(MovieDBFacade.movie_reviews(movie_id)).to be_a(Array)
  end
end
