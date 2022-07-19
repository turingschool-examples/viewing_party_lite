require 'rails_helper'

RSpec.describe '#show' do
  describe 'as a logged in user' do
    before do
      @jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                           password_confirmation: '111')
      @movie_id = 500

      visit login_path

      within '#form' do
        fill_in :email, with: @jose.email
        fill_in :password, with: '111'
        click_on 'Sign In'
      end
    end

    it 'has button to create viewing party', :vcr do
      visit movie_path(@movie_id)

      click_link 'Create Viewing Party'
      expect(current_path).to eq new_movie_viewing_party_path(@movie_id)
    end

    it 'has button to return to discover page', :vcr do
      visit movie_path(@movie_id)

      click_link 'Discover Page'
      expect(current_path).to eq discover_path
    end

    it 'displays movie details', :vcr do
      visit movie_path(@movie_id)

      expect(page).to have_content('Reservoir Dogs')
      expect(page).to have_content('Runtime: 1h 39mins')
      expect(page).to have_content('Genre(s):')
      expect(page).to have_content('Crime')
      expect(page).to have_content('Thriller')
      expect(page).to have_content('A botched robbery indicates a police informant, and the pressure mounts in the aftermath at a warehouse. Crime begets violence as the survivors -- veteran Mr. White, newcomer Mr. Orange, psychopathic parolee Mr. Blonde, bickering weasel Mr. Pink and Nice Guy Eddie -- unravel.')
    end

    it 'displays movie characters and actors', :vcr do
      visit movie_path(@movie_id)

      expect(page).to have_content('Harvey Keitel plays Mr. White / Larry Dimmick')
      expect(page).to have_content('Tim Roth plays Mr. Orange / Freddy Newandyke')
      expect(page).to have_content('Michael Madsen plays Mr. Blonde / Vic Vega')
    end

    it 'displays reviewers and reviews', :vcr do
      visit movie_path(@movie_id)

      expect(page).to have_content('Total Reviews: 2')
      expect(page).to have_content('talisencrw')
      expect(page).to have_content('This unique take on the heist-film-gone-wrong was excellent')
      expect(page).to have_content('Wuchak')
      expect(page).to have_content('The cuss-oriented squabbles of lowlife crooks for 99 minutes')
    end
  end

  describe 'as a not logged in user' do
    before do
      @jose = User.create!(name: 'Jose Andres', email: 'jose.andres@gmail.com', password: '111',
                           password_confirmation: '111')
      @movie_id = 500

      visit login_path
    end

    it 'has button to create viewing party that redirects and warns of need to be logged in', :vcr do
      visit movie_path(@movie_id)

      click_link 'Create Viewing Party'
      expect(current_path).to eq movie_path(@movie_id)
    end
  end
end
