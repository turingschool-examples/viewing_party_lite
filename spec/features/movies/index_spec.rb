require 'rails_helper'

RSpec.describe 'User Movie Results Page' do
  describe 'user visits the movie results page after pressing Top Movies' do

    it 'shows to movies details - title as a link to movie details, and vote avg per movie' do
      @user_1 = create(:user)

      visit user_discover_index_path(@user_1)

      click_button 'Top Rated Movies'

      expect(current_path).to eq(user_movies_path(@user_1))
      expect(page).to have_content("Vote Average: ")
      expect(page).to have_content("The Hobbit") #not sure how to generalize

      # click_link "The Hobbit"
      # expect(current_path).to eq() ##don't know how to send movie id to test it goes to movie details page
    end
  end

  describe 'user visits the movie results page after searching with a keyword' do
      @user_1 = create(:user)
      
      visit user_discover_index_path(@user_1)

      fill_in "Shawshank" #not sure if i have to specify the field to fill in
      click_button 'Find Movies'
      expect(current_path).to eq(user_movies_path(@user_1))
      expect(page).to have_content("Vote Average: ")
      expect(page).to have_content("Shawshank")
  end
end
