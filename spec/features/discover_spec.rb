require 'rails_helper'
require 'faker'

RSpec.describe 'Discover Dashboard' do
  describe 'the discover page' do
    it 'has a top rated movies button that brings you to the top movies page', :vcr do
      user = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)
      visit "/users/#{user.id}/discover"
      
      expect(page).to have_content('Discover Movies')
      expect(page).to have_button('Find Top Rated Movies')
      expect(page).to_not have_link('The Shawshank Redemption')

      click_on "Find Top Rated Movies"
      
      expect(page).to have_link('The Shawshank Redemption')
    end

    it 'has a search field that brings you to a list of movies matching the search', :vcr do
      user = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)
      visit "/users/#{user.id}/discover"
    
      expect(page).to have_button('Find Movies')
      expect(page).to_not have_link('The Shawshank Redemption')

      fill_in 'Find Movies', with: "Shawshank"
      click_on("Find Movies")

      expect(page).to have_link('The Shawshank Redemption')
    end
  end
end 