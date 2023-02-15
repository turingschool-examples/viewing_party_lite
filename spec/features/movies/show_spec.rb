require 'rails_helper'

RSpec.describe 'Movies Show' do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }
  before :each do
    json_response = File.read('spec/fixtures/the_godfather.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['movie_api_key']}&language=en-US")
      .to_return(status: 200, body: json_response)

    json_response_2 = File.read('spec/fixtures/the_godfather_credits.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=#{ENV['movie_api_key']}&language=en-US")
      .to_return(status: 200, body: json_response_2)

    json_response_3 = File.read('spec/fixtures/the_godfather_reviews.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews?api_key=#{ENV['movie_api_key']}&language=en-US")
      .to_return(status: 200, body: json_response_3)
  end

  it 'is linked on the results page' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    json_response_1 = File.read('spec/fixtures/top_rated_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['movie_api_key']}&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page=1&vote_count.gte=1000")
      .to_return(status: 200, body: json_response_1)

    visit discover_index_path
    click_button 'Find Top Rated Movies'

    click_link('The Godfather')

    expect(current_path).to eq(movie_path(238))
  end

  describe 'Movie Information' do
    it 'has a button to create a viewing party that will not work unless logged in' do
      visit movie_path(238)

      click_button('Create Viewing Party for The Godfather')
      expect(page).to have_content('User must be logged in')
    end


    it 'has a button to the discover page' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit movie_path(238)

      click_button('Discover Page')
      expect(current_path).to eq(discover_index_path)
    end

    it 'has a title' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit movie_path(238)

      expect(page).to have_content('The Godfather')
    end

    it 'has a vote average' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit movie_path(238)

      expect(page).to have_content('Vote Average: 8.7')
    end

    it 'has a Runtime' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit movie_path(238)

      expect(page).to have_content('Runtime: 2hr 55min')
    end

    it 'has all genres' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit movie_path(238)

      expect(page).to have_content('Genre: Drama, Crime')
    end

    it 'has a summary' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit movie_path(238)

      expect(page).to have_content('Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.')
    end

    it 'has a list of actors' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit movie_path(238)

      expect(page).to have_content('Don Vito Corleone Marlon Brando')
      expect(page).to have_content("Virgil 'The Turk' Sollozzo Al Lettieri")
      expect(page).to_not have_content("Salvatore 'Sal' Tessio Abe Vigoda")
    end

    it 'has a list of reviews' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit movie_path(238)

      expect(page).to have_content('2 Reviews:')
      expect(page).to have_content('The Godfather is a film considered by most to be one of the greatest ever made.')
      expect(page).to have_content('futuretv')
      expect(page).to have_content('crastana')
      expect(page).to have_content('A masterpiece by the young and talented Francis Ford Coppola, about a Mob family and their drama, the story telling is perfect, the acting good, sometimes a little over the top in the case of Thalia Shire (the sister of the director)')
    end
  end
end
