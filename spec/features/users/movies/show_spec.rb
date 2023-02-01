require 'rails_helper'

RSpec.describe 'Movies Show' do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }
  before :each do
    json_response = File.read('spec/fixtures/the_godfather.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['movie_api_key']}&language=en-US").
      to_return(status: 200, body: json_response)

    json_response_2 = File.read('spec/fixtures/the_godfather_credits.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=#{ENV['movie_api_key']}&language=en-US").
      to_return(status: 200, body: json_response_2)
  end

  it 'is linked on the results page' do
    json_response_1 = File.read('spec/fixtures/top_rated_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['movie_api_key']}&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page=1&vote_count.gte=1000").
      to_return(status: 200, body: json_response_1)

    visit user_discover_index_path(user)
    click_button 'Find Top Rated Movies'

    click_link('The Godfather')

    expect(current_path).to eq(user_movie_path(user, 238))
  end

  describe 'Movie Information' do
    it 'has a button to create a viewing party' do
      visit user_movie_path(user, 238)

      expect(page).to have_button('Create Viewing Party for The Godfather')
    end

    it 'has a button to the discover page' do
      visit user_movie_path(user, 238)

      click_button('Discover Page')
      expect(current_path).to eq(user_discover_index_path(user))
    end

    it 'has a title' do
      visit user_movie_path(user, 238)

      expect(page).to have_content('The Godfather')
    end

    it 'has a vote average' do
      visit user_movie_path(user, 238)

      expect(page).to have_content('Vote Average: 8.7')
    end

    it 'has a Runtime' do
      visit user_movie_path(user, 238)

      expect(page).to have_content('Runtime: 2hr 55min')
    end

    it 'has all genres' do
      visit user_movie_path(user, 238)

      expect(page).to have_content('Genre: Drama, Crime')
    end

    it 'has a summary' do
      visit user_movie_path(user, 238)

      expect(page).to have_content('Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.')
    end

    it 'has a list of actors' do
      visit user_movie_path(user, 238)

      expect(page).to have_content('Don Vito Corleone: Marlon Brando')
      expect(page).to have_content("Virgil 'The Turk' Sollozzo: Al Lettieri")
      expect(page).to_not have_content("Salvatore 'Sal' Tessio: Abe Vigoda")
    end
  end
end