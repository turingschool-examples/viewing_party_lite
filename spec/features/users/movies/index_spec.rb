require 'rails_helper'

RSpec.describe 'The Movie Results Index', type: :feature do
  let!(:user1) { User.create!(name: "Anthony", email: "anthony@gmail.com") }
  let!(:user2) { User.create!(name: "Thomas", email: "thomas@gmail.com") }
  let!(:user3) { User.create!(name: "Jessica", email: "jessica@gmail.com") }
  
  describe 'the discover page button' do
    it 'takes a user back to their discover page' do
      visit user_movies_path(user1)
      
      expect(page).to have_button("Discover Page")

      within("#discover-page-button") do
        click_button("Discover Page")
      end

      expect(current_path).to eq(user_discover_index_path(user1))
    end
  end

  describe 'the top rated movie results' do
    it 'will display the top 20 rated movies when button pressed' do
      visit user_discover_index_path(user1)

      click_button("Top Rated Movies")
      save_and_open_page
      expect(current_path).to eq(user_movies_path(user1))

      # expect page to show top 20 movies from movieAPI
    end
  end
end