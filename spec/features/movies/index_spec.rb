require 'rails_helper'

describe 'The movie results page' do
  before do 
    @user = User.create!(name: 'Brylan', email: 'brylan.gannon112@gmail.com')
    visit "/users/#{@user.id}/discover"
  end

  context 'after clicking the Top Rated button' do
    it 'displays the top 40 movies' do
      click_button 'Top Rated Movies'

      expect(current_path).to eq(user_movies_path(@user))
      expect(page).to have_css('#movie', count: 40) 
    end
  end

  context 'after using the search bar' do
    it 'displays the first 40 movies that match your query' do
      fill_in :query, with: 'mad'
      click_button 'Search by Title'
      expect(page).to have_css('#movie', count: 40)
      expect(page).to have_content('Mad Max')
      expect(page).to have_content('The Mad Hatter')
      expect(page).to have_content('Mad Max 2')
      expect(page).to have_content("It's a Mad, Mad, Mad, Mad World")
      expect(page).to_not have_content('Star Wars')
    end
  end
end
