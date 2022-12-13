require 'rails_helper'

RSpec.describe 'Movie Index Page' do
  before(:each) do
    @user1 = User.create!(name: 'Chad', email: 'chad1@gmail.com', password: "1234test", password_confirmation: "1234test")
    @user2 = User.create!(name: 'Jessica', email: 'jessica2@gmail.com', password: "1234test", password_confirmation: "1234test")
    @user3 = User.create!(name: 'Fiona', email: 'Fiona3@gmail.com', password: "1234test", password_confirmation: "1234test")
  end

  describe 'If the Find Top Rated Movies button is clicked' do
    it 'will have a list of the top 20 movies and their voting average' do
      visit user_discover_path(@user1.id)
      click_button('Find Top Rated Movies')
      expect(current_path).to eq(user_movies_path(@user1.id))

      within('#movie_238') do
        expect(page).to have_content('The Godfather')
        expect(page).to have_content('Vote Average: 8.7')
      end

      within('#movie_851644') do
        expect(page).to have_content('20세기 소녀')
        expect(page).to have_content('Vote Average: 8.6')
      end

      expect(page).to have_no_content('Lock, Stock and Two Smoking Barrels')
    end
  end

  describe 'If the search function is used' do
    it 'if the search field is filled out with a valid movie title, the Search by Movie Title
        button is clicked, the user will be redirected to the movie Index page up to 20 movies
      that match the search parameters along with their vote average and expect title of each movie
      to be a link to that movies show page' do
      visit user_discover_path(@user1.id)
      fill_in :keyword, with: 'Godfather'
      click_button('Search by Movie Title')
      # binding.pry

      within('#movie_242') do
        expect(page).to have_content('The Godfather Part III')
        expect(page).to have_content('Vote Average: 7.4')
      end

      expect(page).to have_no_content('Lock, Stock and Two Smoking Barrels')

      within('#movie_238') do
        expect(page).to have_content('The Godfather')
        expect(page).to have_content('Vote Average: 8.7')
        expect(page).to have_link('The Godfather')
        click_link('The Godfather')
        expect(current_path).to eq(user_movie_path(@user1.id, 238))
      end
    end
  end
end
