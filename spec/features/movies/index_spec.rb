require 'rails_helper'

RSpec.describe 'Movie results page' do
  before(:each) do
    @user1 = User.create!(name: 'John Doe', email: 'johndoe@ymail.com')
  end

  it 'lists top 20 rated movies when user clicks find top rated movies from dash' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['api_key']}")
        .to_return(status: 200, body: File.read('spec/fixtures/top_rated_movies.json'))

    visit user_discover_index_path(@user1)

    expect(page).to have_link('Find Top Rated Movies', href: "/users/#{@user1.id}/movies?q=top%20rated")

    click_link 'Find Top Rated Movies'

    expect(page).to have_content('The Godfather 8.7')
    expect(page).to have_content('The Shawshank Redemption 8.7')
    expect(page).to have_content('The Godfather Part II 8.6')
  end

  it 'populates relevant results given a keyword search from dashboard' do
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['api_key']}&include_adult=false&query=The%20Matrix")
        .to_return(status: 200, body: File.read('spec/fixtures/search_for_the_matrix.json'))

    visit user_discover_index_path(@user1)

    fill_in('q', with: 'The Matrix')
    click_on('Find Movies')

    expect(current_path).to eq(user_movies_path(@user1))
    expect(page).to have_content('The Matrix Resurrections 6.6 The Matrix 8.2')
  end

  it 'has a link back to the discover page' do
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['api_key']}")
        .to_return(status: 200, body: File.read('spec/fixtures/top_rated_movies.json'))

    visit "/users/#{@user1.id}/movies?q=top%20rated"

    expect(page).to have_link('Discover Page', href: user_discover_index_path(@user1))
  end

  it 'links each movie to that leads to the movie details page' do
        stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['api_key']}")
        .to_return(status: 200, body: File.read('spec/fixtures/top_rated_movies.json'))

        visit "/users/#{@user1.id}/movies?q=top%20rated"

        expect(page).to have_link('The Godfather', href: user_movie_path(@user1, 238))
        expect(page).to have_link('The Shawshank Redemption', href: user_movie_path(@user1, 278))
  end
end
