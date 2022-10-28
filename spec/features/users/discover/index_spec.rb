require 'rails_helper'

RSpec.describe 'the users discover index' do
  describe 'When I visit the users discover path' do
    let!(:user) { create :user }
    before :each do
      visit login_path

      fill_in 'Email', with: "#{user.email}"
      fill_in 'Password', with: "#{user.password}"

      click_button 'Log In'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit discover_path
    end

    it 'has a button to discover top rated movies' do
      expect(page).to have_button('Discover Top Rated Movies')
    end

    it 'has a text field to enter a search by movie title' do
      expect(page).to have_field('Search')
    end

    it 'has a button to search by movie title' do
      expect(page).to have_button('Search by Movie Title')
    end

    describe 'When I click on the top rated movies' do
      it 'redirects to the movies results page' do
        VCR.use_cassette('top_rated_movies') do
          click_button 'Discover Top Rated Movies'
          expect(current_path).to eq(dashboard_movies_path)
        end
      end
    end

    describe 'When I click on the search button' do
      it 'redirects to the movies results page' do
        VCR.use_cassette('search_Minions') do
          fill_in 'Search', with: 'Minions'
          click_button 'Search by Movie Title'
          expect(current_path).to eq(dashboard_movies_path)
          expect(page).to have_content('Minions')
        end
      end
    end
  end
end
