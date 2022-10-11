require 'rails_helper'

RSpec.describe 'Discover movies page' do
  describe "When I visit '/users/:id/discover'" do
    it 'I should see a button to Discover Top Rated Movies' do
      user = create(:user)
      visit "/users/#{user.id}/discover"
      expect(page).to have_button('Discover Top Rated Movies')
    end

    it 'I see a text field to enter keywords to search by title' do
      user = create(:user)
      visit "/users/#{user.id}/discover"
      expect(page).to have_field('Search by Movie Title')
      expect(page).to have_button('Search by Movie Title')
    end

    it 'When I search for a movie I am taken to the Movie Results Page' do
      user = create(:user)
      visit "/users/#{user.id}/discover"
      # Details: There should only be a maximum of 40 results. The above details should be listed for each movie.
      fill_in('Search by Movie Title', with: 'Fight Club')
      click_button('Search by Movie Title')
      expect(current_path).to eq("/users/#{user.id}/movies")

      expect(page).to have_content('Average Votes:')
      expect(page).to have_link('Fight Club')
      expect(page).to have_button('Return to Disover Page')
    end


  end
end

