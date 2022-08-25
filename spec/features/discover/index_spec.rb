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
         expect(page).to have_button('Discover Top Rated Movies')
      end

      it 'click discover top rated movies button to see results' do
         user_1 = User.create!(name: 'Cindy Lou', email: 'cidlou@gmail.com')

         visit "/users/#{user_1.id}/discover"

         click_button('Discover Top Rated Movies')

         expect(current_path).to eq("/users/#{user_1.id}/movies")
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

      xit "can  search by keywords" do
         user = User.create!(name: "Nancy", email: "nancydrew@email.com")
      
         visit "/users/#{user.id}/discover"

         fill_in :query, with: 'Fight Club'
         click_button 'Search'

         expect(current_path).to eq(user_movies_path(user.id))
         expect(page).to have_content("Fight Club")
      end
   end
end