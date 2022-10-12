require 'rails_helper'

RSpec.describe 'a users movies show page', type: :feature do
  describe 'As a user once I am logged in' do
    describe 'When I have already searched for a movie & see the list of results' do

      it 'I can click on one movie result link and be taken to that movies details page' do
        user = create(:user)
        visit "/users/#{user.id}/discover"
        fill_in('Search by Movie Title', with: 'fight')
        click_button('Search by Movie Title')
        click_link('Fight Club')
        expect(current_path).to eq("/users/#{user.id}/movies/#{movie.id}")
      end

      it 'I can see a button to create a viewing party &  a button to return to the discover page which takes you back to the discover page' do
        user = create(:user)
        visit "/users/#{user.id}/discover"
        fill_in('Search by Movie Title', with: 'fight')
        click_button('Search by Movie Title')
        click_link('Fight Club')
        expect(page).to have_button('Create a Viewing Party')
        expect(page).to have_button('Discover Page')
        click_button('Discover Page')
        expect(current_path).to eq("/users/#{user.id}/discover")
      end

      it 'The viewing party button should take the user to a new viewing party page' do

        user = create(:user)
        visit "/users/#{user.id}/discover"
        fill_in('Search by Movie Title', with: 'fight')
        click_button('Search by Movie Title')
        click_link('Fight Club')
        click_button('Create a Viewing Party')

        expect(current_path).to eq("/users/#{user.id}/movies/#{movie.id}/viewing-party/new")
      end

    end
  end
end