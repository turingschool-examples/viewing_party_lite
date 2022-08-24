require 'rails_helper'

RSpec.describe 'discover movies page', type: :feature do
   it 'has title' do
      user = User.create!(name: "Nancy", email: "nancydrew@email.com")

      visit user_path(user.id)
      expect(page).to have_link("Discover Movies")

      click_link "Discover Movies"
      expect(current_path).to eq(user_discover_index_path(user.id))
   end

   describe "#buttons" do
      it 'has button to discover top rated movies' do
         user_1 = User.create!(name: 'Cindy Lou', email: 'cidlou@gmail.com')

         visit "/users/#{user_1.id}/discover"
      save_and_open_page
         expect(page).to have_button('Discover Top Rated Movies')
      end

      it 'has form to search for a movie' do
         user_1 = User.create!(name: 'Cindy Lou', email: 'cidlou@gmail.com')

         visit "/users/#{user_1.id}/discover"

         expect(page).to have_field('Search Movies')
      end

      it 'has button to search for a movie by name' do
         user_1 = User.create!(name: 'Cindy Lou', email: 'cidlou@gmail.com')

         visit "/users/#{user_1.id}/discover"

         expect(page).to have_button('Search')
      end
   end
end