require 'rails_helper'

RSpec.describe 'the users_movies results page' do
  scenario "user clicks on top 20 rated" do
    user = User.create!(name: 'user', email: 'email')
    VCR.use_cassette('top_rated_movies') do
      visit "/users/#{user.id}/discover"
      within '#discover' do
        click_button 'Top Rated Movies'
      end
    end

    within '#top20' do
      expect(page).to_not have_content('Movie Results for:')
      expect(page).to have_content('Top Rated Movies')

      expect(page).to have_link('The Shawshank Redemption')
      expect(page).to have_content('Vote Average: 8.7')

      expect(page).to_not have_link('Jack Reacher')
      expect(page).to_not have_content('Vote Average: 6.6')
    end
  end

  scenario "user searches for Jack Reacher" do
    user = User.create!(name: 'user', email: 'email')

    VCR.use_cassette('movie_search') do
      visit "/users/#{user.id}/discover"
      within '#discover' do

        fill_in 'Search For Movie', with: 'Jack Reacher'
        click_button('Search')
      end
    end

    within '#results' do
      expect(page).to have_content('Movie Results')
      expect(page).to_not have_content('Top Rated Movies')

      expect(page).to_not have_link('The Shawshank Redemption')
      expect(page).to_not have_content('Vote Average: 8.7')

      expect(page).to have_link('Jack Reacher')
      expect(page).to have_content('Vote Average: 6.6')
    end
  end
end