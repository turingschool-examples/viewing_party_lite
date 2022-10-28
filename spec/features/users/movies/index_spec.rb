# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie results page' do
  describe 'When discover top rated movies is clicked' do
    let!(:user) { create :user }
    before :each do
      visit login_path
      
      fill_in 'Email', with: "#{user.email}"
      fill_in 'Password', with: "#{user.password}"

      click_button 'Log In'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit discover_path
    end

    it 'displays the 20 top rated movies' do
      VCR.use_cassette('top_rated_movies_index') do
        click_button 'Discover Top Rated Movies'
        movies = MoviesFacade.top_rated

        expect(current_path).to eq(dashboard_movies_path)
        expect(page).to have_content(movies.first.title)
        expect(page).to have_content(movies.first.vote_average)
        expect(page).to have_content(movies.last.title)
        expect(page).to have_content(movies.last.vote_average)
        expect(page).to have_link(movies.first.title.to_s)

        click_link movies.first.title.to_s

        expect(current_path).to eq("/dashboard/movies/#{movies.first.id}")
      end
    end

    describe 'When a movie title is searched' do
      it 'displays up to 40 results from the search', :vcr do
        fill_in 'Search', with: 'Top Gun'
        click_on 'Search by Movie Title'

        movies = MoviesFacade.search('Top Gun')

        expect(current_path).to eq(dashboard_movies_path)
        expect(page).to have_content('Top Gun')
        expect(page).to have_link movies.first.title

        click_on movies.first.title

        expect(current_path).to eq("/dashboard/movies/#{movies.first.id}")
      end

      it 'will return nothing if a movie title has no match', :vcr do  
        fill_in 'Search', with: 'Top Gun 17'
        click_on 'Search by Movie Title'

        expect(current_path).to_not have_content('Top Gun')
      end
    end
  end
end