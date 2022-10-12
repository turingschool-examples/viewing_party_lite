require 'rails_helper'

RSpec.describe 'Discover Movies Page', type: :feature do
  describe 'When I visit the user_discover_index_path, I should see' do
    it 'has a button to discover top rated movies' do
      user1 = User.create!(name: 'Erin', email: 'epintozzi@turing.edu')

      visit user_discover_index_path(user1)

      expect(page).to have_button('Find Top Rated Movies')
    end

    it 'when the top rated movies button is clicked, the user is taken to the movies results page' do
      user1 = User.create!(name: 'Erin', email: 'epintozzi@turing.edu')

      visit user_discover_index_path(user1)

      click_button('Find Top Rated Movies')

      expect(current_path).to eq("/users/#{user1.id}/movies?q=top%20rated")
    end

    it 'has a text field to enter keyword(s) to search by movie title' do
      user1 = User.create!(name: 'Erin', email: 'epintozzi@turing.edu')

      visit user_discover_index_path(user1)

      expect(page).to have_field('search')
    end

    it 'has a button to search by Movie Title' do
      user1 = User.create!(name: 'Erin', email: 'epintozzi@turing.edu')

      visit user_discover_index_path(user1)

      expect(page).to have_button('Find Movies')
    end

    it 'when the search field is filled in and the search button is clicked, the user is taken to the movies results page' do
      user1 = User.create!(name: 'Erin', email: 'epintozzi@turing.edu')

      visit user_discover_index_path(user1)

      fill_in('search', with: 'Avatar')
      click_button('Find Movies')

      expect(current_path).to eq("users/#{user1.id}/movies?q=avatar")
    end

    it 'when the search field is not filled in and the search button is clicked, the user is redirected back to the discover page' do
      user1 = User.create!(name: 'Erin', email: 'epintozzi@turing.edu')

      visit user_discover_index_path(user1)

      fill_in('search', with: '')
      click_button('Find Movies')

      expect(current_path).to eq(user_discover_index_path(user1))
    end
  end
end
