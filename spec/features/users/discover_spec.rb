require 'rails_helper'

RSpec.describe 'Discover Page', type: :feature do
  describe 'correct user id' do
    it 'has is the same user id from the dashboard' do
      user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')
      user2 = User.create!(name: 'Jim', email: 'musk42@trenches.org')

      visit "/users/#{user1.id}/discover"
      expect(page).to have_content("#{user1.name}'s Discover Page")
    end


    it 'has button to discover top rated movies' do
      user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')

      visit "/users/#{user1.id}/discover"
      expect(page).to have_button('Discover Top Rated Movies')
    end

    it 'has a text field to enter keyword(s) to search by movie title' do
      user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')

      visit "/users/#{user1.id}/discover"
        within '.movie_search'
      expect(page).to have_field('search', placeholder: 'Search by movie title')

    end

    it 'has a Button to Search by Movie Title' do
      user1 = User.create!(name: 'Parker', email: 'mangaforever@hootube.net')

      visit "/users/#{user1.id}/discover"
        within '.movie_search'
      expect(page).to have_button('Find Movies')
    end
  end
end
