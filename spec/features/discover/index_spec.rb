require 'rails_helper'

RSpec.describe 'Discover index page' do
  before(:each) do
    @user = User.create!(name: 'Max', email: 'max@supercool.edu', password: "Max")

    visit "/login"
    fill_in(:email, with: @user.email)
    fill_in(:password, with: @user.password)
    click_on "Log In"

    visit "/dashboard/discover"

  end

  describe 'index page' do
    it 'checks for description of page' do
      expect(page).to have_content('Discover Movies')
    end

    it 'has a button to discover top rated movies' do
      expect(page).to have_button('Find Top Rated Movies')
    end

    it 'has a text field to enter movie titles keywords' do
      expect(page).to have_content('Search for a Movie!')
    end

    it 'has a button to search movie titles' do
      expect(page).to have_button('Search')
    end
  end

  describe 'discover movies' do
    it 'redirects you to the movie results page' do
      expect(page).to have_button('Find Top Rated Movies')
      click_button 'Find Top Rated Movies'
      expect(page).to have_current_path("/dashboard/movies?q=top%20rated")
    end
  end
end
