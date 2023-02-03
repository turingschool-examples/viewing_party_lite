require 'rails_helper'

RSpec.describe 'Users discover index' do
  before(:each) do
    @user_1 = User.create!(name: 'William', email: 'william@gmail.com')
    @user_2 = User.create!(name: 'Christian', email: 'christian@gmail.com')
    @user_3 = User.create!(name: 'Fake', email: 'fake@gmail.com')

    @viewing_party_1 = ViewingParty.create!(title: 'Top Gun', duration: 120, start_time: '14:22', host: @user_2.id)
    @viewing_party_2 = ViewingParty.create!(title: 'Hereditary', duration: 111, start_time: '09:46', host: @user_1.id)

    @viewing_party_user_1 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_1.id)
    @viewing_party_user_2 = ViewingPartyUser.create!(user_id: @user_2.id, viewing_party_id: @viewing_party_1.id)

    visit user_discover_index_path(@user_1)
  end

  it 'has a button to discover top rated movies' do
    expect(page).to have_button('Discover Top Rated Movies')
  end

  it 'has a text field to enter keyword(s) to search by movie title' do
    expect(page).to have_field('Search')
  end

  it 'has a button to search by movie title' do
    expect(page).to have_button('Search by Movie Title')
  end

  describe 'when user clicks on Top Rated Movies' do
    it 'redirects to the movies results page' do
      # stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=17774d224d9d374cf775b5850c113b88").
      # to_return(status: 200, body: File.read('spec/fixtures/top_rated_response.json'), headers: {})

      click_button('Discover Top Rated Movies')
    end
  end

  describe 'when user clicks on search button' do
    it 'redirects to the movies results page' do
      # stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=17774d224d9d374cf775b5850c113b88&query=Top%20Gun").
      # to_return(status: 200, body: File.read('spec/fixtures/top_gun_response.json'), headers: {})

      fill_in :search, with: 'Top Gun'
      click_button('Search by Movie Title')
      expect(page).to have_content('Top Gun')
    end
  end

  describe 'when user clicks on search button' do
    it 'links to movie show page' do
      # stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=17774d224d9d374cf775b5850c113b88").
      #   to_return(status: 200, body: File.read('spec/fixtures/top_rated_godfather.json'), headers: {})

      click_button('Discover Top Rated Movies')

      # stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=17774d224d9d374cf775b5850c113b88").
      #    to_return(status: 200, body: File.read('spec/fixtures/godfather_response.json'), headers: {})

      click_on 'The Godfather'
      expect(page).to have_content('The Godfather')
      expect(page).to have_content('8.715')
      expect(page).to have_content('175')
      expect(page).to have_content('Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.')
      expect(page).to have_content('Drama')
      expect(page).to have_content('Crime')

      expect(page).to have_content('Marlon Brando, as Don Vito Corleone')
      expect(page).to have_content('Al Pacino, as Don Michael Corleone')
      expect(page).to have_content('Reviewer: futuretv')
      expect(page).to have_content('Reviewer: crastana')
    end
  end
end
