require 'rails_helper'

RSpec.describe 'The new viewing party page' do
  before :each do
    stub_request(:get, "https://api.themoviedb.org/3/movie/497?api_key=#{ENV['MOVIE_DB_KEY']}")
    .to_return(status: 200, body: File.read('./spec/fixtures/green_mile/details_response.json'), headers: {})
  end

  let!(:charlie) { User.create!(name: 'Charlie', email: 'charlie_boy@gmail.com') }
  let!(:cindy) { User.create!(name: 'Cindy', email: 'user@gmail.com') }
  let!(:louis) { User.create!(name: 'Louis', email: 'email_me@gmail.com') }

  it 'lists the movie title above the form' do
    visit "/users/#{charlie.id}/movies/497/viewing-party/new"

    expect(page).to have_content('The Green Mile')
  end

  describe 'happy path' do
    it 'creates a new viewing party with default duration and no other users' do
      visit "/users/#{charlie.id}/movies/497/viewing-party/new"
      within('#form') do
        fill_in 'day', with: Date.tomorrow
        fill_in 'time', with: Time.now
        click_button 'Create Party'
      end
      expect(current_path).to eq("/users/#{charlie.id}")
    end
    
    it 'creates viewing party with custom duration and no other users' do
      visit "/users/#{charlie.id}/movies/497/viewing-party/new"
      within('#form') do
        fill_in 'duration', with: "200"
        fill_in 'day', with: Date.tomorrow
        fill_in 'time', with: Time.now
        click_button 'Create Party'
      end
      expect(current_path).to eq("/users/#{charlie.id}")
    end
    it 'creates viewing party with default duration and other users'
    it 'shows up on other users dashboards (show pages)'
  end

  describe 'sad path' do
    it 'does not create viewing party with duration less than movie runtime'
  end
end
