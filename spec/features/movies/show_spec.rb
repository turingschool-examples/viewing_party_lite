require 'rails_helper'

RSpec.describe 'The movie show page' do 
  describe 'As a user when I visit the movie details page (users/:id/movies/:movie_id where :id is a valid user id' do 
    it 'displays a button to create a viewing party and a button to return to discover', :vcr do 
      user = User.create!(name: "Amanda", email: "amanda@turing.edu")
      visit user_movie_path(user, 128)

      expect(page).to have_button('Create Viewing Party For Princess Mononoke')
      expect(page).to have_button('Discover Page')

      click_button('Discover Page')
      
      expect(current_path).to eq("/users/#{user.id}/discover")
    end

    it 'displays the movie details: title, vote average, runtime, genre(s), summary', :vcr do 
      user = User.create!(name: "Amanda", email: "amanda@turing.edu")
      visit user_movie_path(user, 128)

      expect(page).to have_content("Princess Mononoke")
      expect(page).to have_content("Vote: 8.348")
      expect(page).to have_content("Runtime: 2hr 14min")
      expect(page).to have_content("Genre: Adventure, Fantasy, Animation")
    end

    it 'displays the first 10 cast members' do 

    end

    it 'displays count of total reviews and all the authors and their information' do 

    end
  end
end