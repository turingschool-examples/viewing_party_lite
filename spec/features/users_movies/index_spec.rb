require 'rails_helper'

RSpec.describe 'the users_movies results page' do

  before :each do 
    UserParty.destroy_all
    User.destroy_all
    Party.destroy_all
    visit register_path
    fill_in 'Name', with: 'Plain Name'
    fill_in 'Email', with: 'User@gmail.com'
    fill_in 'Password', with: '1234'
    fill_in 'Password confirmation', with: '1234'

    click_button('Register')
    @user = User.last
  end 

  scenario "user clicks on top 20 rated" do

    VCR.use_cassette('top_rated_movies') do
      visit "/discover"
        click_button 'Top Rated Movies'
    end

    within '#top20' do
      expect(page).to_not have_content('Movie Results for:')
      expect(page).to have_content('Top Rated Movies')

      expect(page).to have_link('The Shawshank Redemption')
      # expect(page).to have_content('Vote Average: 8.7')

      expect(page).to_not have_link('Jack Reacher')
      # expect(page).to_not have_content('Vote Average: 6.6')
    end
  end

  scenario "user searches for Jack Reacher" do

    VCR.use_cassette('movie_search') do
      visit "/discover"
      within '#discover' do

        fill_in 'Search For Movie', with: 'Jack Reacher'
        click_button('Search')
      end
    end

    within '#results' do
      expect(page).to have_content('Movie Results')
      expect(page).to_not have_content('Top Rated Movies')

      expect(page).to_not have_link('The Shawshank Redemption')
      # expect(page).to_not have_content('Vote Average: 8.7')

      expect(page).to have_link('Jack Reacher')
      # expect(page).to have_content('Vote Average: 6.6')
    end
  end
end
