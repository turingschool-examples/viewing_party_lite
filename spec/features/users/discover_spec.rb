# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user discover page' do
  before(:each) do
    ViewingPartyUser.delete_all
    ViewingParty.delete_all
    User.delete_all
    @user = create(:user)
    top_20_response = File.read('spec/fixtures/topmovies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: top_20_response)
    search_results = File.read('spec/fixtures/godfather_search.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?query=Godfather&api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: search_results)
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_DB_KEY']}&query=")
      .to_return(status: 200, body: '')
    no_response = File.read('spec/fixtures/no_response.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_DB_KEY']}&query=asdfaoisdn")
      .to_return(status: 404, body: no_response)

    visit login_path
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_button("Log In")
  end

  it 'displays the page title' do
    visit "/discover"

    expect(page).to have_content('Viewing Party')
    expect(page).to have_content('Discover Movies')
  end

  it 'has a button to redirect to the movies results page with the top 20 rated movies displayed' do
    visit "/discover"

    within '#top_rated' do
      expect(page).to have_button('Find Top Rated Movies')
      click_button('Find Top Rated Movies')

      expect(current_path).to eq("/movies")
    end
  end

  it 'has a search field that redirects back to itself if no input exists' do
    visit "/discover"

    within '#search_movies' do
      expect(page).to have_field :search
      expect(page).to have_button('Find Movies')

      click_button('Find Movies')
      expect(current_path).to eq("/discover")
    end
    expect(page).to have_content('No Results Found')
  end

  it 'has a search field that redirects back to itself with a flash error message when no results are found' do
    visit "/discover"

    within '#search_movies' do
      fill_in :search, with: 'asdfaoisdn'

      click_button('Find Movies')
      expect(current_path).to eq("/discover")
    end
    expect(page).to have_content('No Results Found')
  end

  it 'works to find movies when a valid movie title is input in the search bar' do
    visit "/discover"

    within '#search_movies' do
      fill_in :search, with: 'Godfather'
      click_button('Find Movies')
      expect(current_path).to eq("/movies")
    end
  end
end
