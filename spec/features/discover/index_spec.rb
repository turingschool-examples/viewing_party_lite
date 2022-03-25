# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Discover Index Page' do
  before(:each) do
    @user1 = User.create(name: 'Asil Rolyat', email: 'asil.rolyat@yourmom.com')
    visit user_discover_index_path(@user1)
  end

  it 'has a button for Top Rated Movies and Search by Movie Title' do
    expect(page).to have_button('Top Rated Movies')
    expect(page).to have_button('Find Movies')
  end

  it 'has a text field for key words' do
    expect(page).to have_field('Keywords')
  end

  it 'allows user to use Top Rated Button' do
    results = File.read('spec/fixtures/top_rated_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movie_api_key']}")
      .to_return(status: 200, body: results)
    click_button 'Top Rated Movies'

    expect(current_path).to eq(user_movies_path(@user1))
    expect(page.status_code).to eq 200
    expect(page).to have_content('Shawshank Redemption')
    expect(page).to have_content(8.7)
  end

  it 'allows user to search by keyword' do
    results = File.read('spec/fixtures/search_bat_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_api_key']}&query=bat")
      .to_return(status: 200, body: results)
    fill_in :search, with: 'bat'
    click_button 'Find Movies'

    expect(current_path).to eq(user_movies_path(@user1))
    expect(page.status_code).to eq 200
    expect(page).to have_content('Bat Thumb')
  end

  it 'allows user to search by multiple keywords' do
    results = File.read('spec/fixtures/multi_word_search_bat.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_api_key']}&query=Batman Beg")
      .to_return(status: 200, body: results)
    fill_in :search, with: 'Batman Beg'
    click_button 'Find Movies'

    expect(current_path).to eq(user_movies_path(@user1))
    expect(page.status_code).to eq 200
    expect(page).to have_content('Batman Begins')
  end

  it 'returns nothing if no keywords match search' do
    results = File.read('spec/fixtures/search_bat_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_api_key']}&query=Batman Begggg")
      .to_return(status: 200, body: results)
    fill_in :search, with: 'Batman Begggg'
    click_button 'Find Movies'

    expect(current_path).to eq(user_movies_path(@user1))
    expect(page.status_code).to eq 200
    expect(page).to_not have_content('Batman Begins')
  end
end
