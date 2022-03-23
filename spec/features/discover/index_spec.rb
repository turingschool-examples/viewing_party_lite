require 'rails_helper'

RSpec.describe 'Discover index page' do
  describe 'index page' do
    it 'checks for description of page' do
      user = User.create!(name: 'Sam', email: 'sam@supercool.edu')
      visit "/users/#{user.id}/discover"
      expect(page).to have_content('Discover Movies')
    end
    it 'has a button to discover top rated movies' do
      user = User.create!(name: 'Sam', email: 'sam@supercool.edu')
      visit "/users/#{user.id}/discover"
      expect(page).to have_button('Find Top Rated Movies')
    end
    it 'has a text field to enter movie titles keywords' do
      user = User.create!(name: 'Sam', email: 'sam@supercool.edu')
      visit "/users/#{user.id}/discover"
      expect(page).to have_content('Search for a Movie!')
    end

    it 'has a button to search movie titles' do
      user = User.create!(name: 'Sam', email: 'sam@supercool.edu')
      visit "/users/#{user.id}/discover"
      expect(page).to have_button('Search')
    end
  end

  describe 'discover movies' do
    it 'redirects you to the movie results page' do
      user = User.create!(name: 'Sam', email: 'sam@supercool.edu')
      visit "/users/#{user.id}/discover"
      expect(page).to have_button('Find Top Rated Movies')
      click_button 'Find Top Rated Movies'
      expect(page).to have_current_path("/users/#{user.id}/movies?q=top%20rated")
    end
  end
end
