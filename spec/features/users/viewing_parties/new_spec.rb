require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do 
  before :each do 
    @user = create(:user)
    @movie_id = 14
    visit new_user_movie_viewing_party_path(@user.id, @movie_id)
  end
  
  describe 'navigation' do 
    it 'should have a discover page button' do 
      visit user_movies_path(@user)

      click_button "Discover Page"

      expect(current_path).to eq(discover_user_path(@user))
    end
  end

  describe 'New viewing party form' do 
    it 'displays the movie that user is creating a party for' do 

      expect(page).to have_content("Create a Movie Party for American Beauty")
    end
  end
end