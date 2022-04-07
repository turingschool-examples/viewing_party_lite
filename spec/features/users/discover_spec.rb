require 'rails_helper'

RSpec.describe 'Discover Page' do

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

  it 'has a button to discover top rated movies' do
    # UserParty.destroy_all
    # User.destroy_all
    # Party.destroy_all
    # user = User.create!(name: 'user', email: 'email', password: 'pass123')

    VCR.use_cassette('top_rated_movies') do
      visit "/discover"
      within '#discover' do
        expect(page).to have_button('Top Rated Movies')
        click_button 'Top Rated Movies'
        expect(current_path).to eq(movies_path)
      end
    end
  end

  it 'has a search bar to search for specific movies' do
    # UserParty.destroy_all
    # User.destroy_all
    # Party.destroy_all
    # user = User.create!(name: 'user', email: 'email', password: 'pass123')

    VCR.use_cassette('movie_search') do
      visit "/discover"
      within '#discover' do

        fill_in 'Search For Movie', with: 'Jack Reacher'
        click_button('Search')
        expect(current_path).to eq(movies_path)
      end
    end
  end
end
