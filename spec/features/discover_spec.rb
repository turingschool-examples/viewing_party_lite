require 'rails_helper'
require 'faker'

RSpec.describe 'Discover Dashboard' do
  describe 'the discover page' do
    it 'has a top rated movies button that brings you to the top movies page' do
      user = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email)
      visit "/users/#{user.id}/discover"
      
      expect(page).to have_content('Discover Movies')
      expect(page).to have_button('Find Top Rated Movies')

      click_on "Find Top Rated Movies"

      expect(current_path).to eq("/users/#{user1.id}/movies?q=top%20rated")
    end
  end
end 