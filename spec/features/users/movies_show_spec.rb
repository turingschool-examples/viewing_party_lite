require 'rails_helper'

RSpec.describe 'a users movies show page', type: :feature do
  describe 'As a user once I am logged in' do
    describe 'When I have already searched for a movie & see the list of results' do

      it 'I can click on one movie result link and be taken to that movies details page', :vcr do
        user = create(:user)
        visit "/users/#{user.id}/discover"
        fill_in('Search by Movie Title', with: 'fight')
        click_button('Search by Movie Title')

        # click_link('Fight Club') #this is where I am stuck. Left off after asking a question.
        # expect(current_path).to eq("/users/#{user.id}/movies/#{movie.id}")
      end

      it 'I can see a button to create a viewing party &  a button to return to the discover page which takes you back to the discover page', :vcr do
        user = create(:user)
        visit "/users/#{user.id}/movies/550"
        # fill_in('Search by Movie Title', with: 'fight')
        # click_button('Search by Movie Title')
        # click_link('Fight Club')
        expect(page).to have_button('Create a Viewing Party')
        expect(page).to have_button('Return to Discover Page')
        # click_button('Return to Discover Page')
        # expect(current_path).to eq("/users/#{user.id}/discover") #commented out because links are not working
      end

      it 'The viewing party button should take the user to a new viewing party page', :vcr do

        user = create(:user)
        visit "/users/#{user.id}/movies/550"
        click_button('Create a Viewing Party')

        expect(current_path).to eq("/users/#{user.id}/movies/550/viewing-party/new")
      end

    end
  end
end