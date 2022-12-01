require 'rails_helper'

RSpec.describe 'New viewing party page' do

  describe 'as a user when I visit the movie show page I can click a button to create new party' do
    it 'it take me to "/users/:user_id/movies/:movie_id/viewing_parties/new"', :vcr do 
     user = User.create!(name: 'Amanda', email: 'amanda@turing.edu')
     visit user_movie_path(user, 128)
     click_button('Create Viewing Party For Princess Mononoke')
     expect(current_path).to eq("/users/#{user.id}/movies/128/viewing_parties/new")
    end
  end

   it 'has a button to take the user back to the discover page', :vcr do
     user = User.create!(name: 'Amanda', email: 'amanda@turing.edu')
     visit user_movie_path(user, 128)
     click_button('Create Viewing Party For Princess Mononoke')
     expect(page).to have_button('Discover Page')
   end

    it 'has the form to create a new viewing party with details rendered', :vcr do
     user = User.create!(name: 'Amanda', email: 'amanda@turing.edu')
     user2 = User.create!(name: 'Annie', email: 'annie@turing.edu')
     user3 = User.create!(name: 'James', email: 'james@turing.edu')
     visit "/users/#{user.id}/movies/128/viewing_parties/new"
     expect(page).to have_field("movie_title", with: "Princess Mononoke")
     expect(page).to have_field("duration", with: 134)
     expect(page).to have_field("date")
     expect(page).to have_field("start_time")
     expect(page).to have_field("#{user2.id}")
     expect(page).to have_field("#{user3.id}")
     expect(page).to have_button("Create Party")
   end

   it 'returns the user back to their dashboard after create party button is clicked', :vcr do 
     user = User.create!(name: 'Amanda', email: 'amanda@turing.edu')
     user2 = User.create!(name: 'Annie', email: 'annie@turing.edu')
     user3 = User.create!(name: 'James', email: 'james@turing.edu')
     visit "/users/#{user.id}/movies/128/viewing_parties/new"
     fill_in("duration", with: 150)
     fill_in("date", with: "2022/12/01")
     fill_in("start_time", with: "19:00")
     check("#{user2.id}")
     check("#{user3.id}")
     click_button("Create Party")
     #save_and_open_page

   end
end
