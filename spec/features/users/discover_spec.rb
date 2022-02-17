require 'rails_helper'

RSpec.describe 'User Discover Page' do
  describe 'view' do
    before(:each) do
      @user_1 = User.create!(name: "David", email: "david@email.com", password: 'test', password_confirmation: 'test')
      @party_1 = @user_1.parties.create!(duration: 180, day: "December 12, 2021", start_time: "7:00 pm", movie_id: 1, user_id: @user_1.id)
    end
    it 'has a home link which takes the user back to the home page' do
      visit "/users/#{@user_1.id}/discover"

      click_link('Home')
      expect(current_path).to eq(root_path)
    end

    it 'allows user to search for movie', :vcr do
      visit "/users/#{@user_1.id}/discover"

      movie = MovieFacade.search_for_movie('Aliens').first

      fill_in :search, with: 'Aliens'
      click_button 'Search'
      expect(page.status_code).to eq 200
      expect(page).to have_content(movie.title)

      expect(page).to have_content("Vote Average: #{movie.vote_average}")
    end

    it 'goes back to discover page after filling in form when clicking button', :vcr do
      visit "/users/#{@user_1.id}/discover"

      fill_in :search, with: 'Aliens'
      click_button 'Search'
      expect(page.status_code).to eq 200
      click_button 'Discover Page'
      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end
    it 'shows movie details', :vcr do
      visit "/users/#{@user_1.id}/movies?query=top%40rated"

      top_movie = MovieFacade.top_movies.first

      expect(page).to have_link(top_movie.title)
      expect(page).to have_content(top_movie.vote_average)
    end
  end
end
