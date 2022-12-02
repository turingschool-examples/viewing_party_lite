require 'rails_helper'

RSpec.describe 'Movie Search' do
  before(:each) do
    @user1 = User.create!(name: 'Chad', email: 'chad1@gmail.com')
    @user2 = User.create!(name: 'Jessica', email: 'jessica2@gmail.com')
    @user3 = User.create!(name: 'Fiona', email: 'Fiona3@gmail.com')
  end

  # describe 'happy path' do
  #   it 'allows a user to search for a movie title' do
  #     # "id": 238,
  #     # "original_language": "en",
  #     # "original_title": "The Godfather",
  #     visit user_discover_path(@user1.id)
  #     fill_in :search, with: 'The Godfather'
  #     click_button 'Search'

  #     expect(page.status_code).to eq(200)
  #     expect(current_path).to eq(user_movies_path(@user1.id))
  #     expect(page).to have_content('The Godfather')
  #   end
  # end
end
