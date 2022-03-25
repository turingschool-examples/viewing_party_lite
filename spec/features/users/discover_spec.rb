require 'rails_helper'

RSpec.describe 'Discover Page' do
  it 'has a button to discover top rated movies' do
    UserParty.destroy_all
    User.destroy_all
    Party.destroy_all
    user = User.create!(name: 'user', email: 'email')

    VCR.use_cassette('top_rated_movies') do
      visit "/users/#{user.id}/discover"
      within '#discover' do
        expect(page).to have_button('Top Rated Movies')
        click_button 'Top Rated Movies'

        expect(current_path).to eq(user_movies_path(user.id))
      end
    end
  end

  it 'has a search bar to search for specific movies' do
    UserParty.destroy_all
    User.destroy_all
    Party.destroy_all
    user = User.create!(name: 'user', email: 'email')

    VCR.use_cassette('movie_search') do
      visit "/users/#{user.id}/discover"
      within '#discover' do

        fill_in 'Search For Movie', with: 'Jack Reacher'
        click_button('Search')
        expect(current_path).to eq(user_movies_path(user.id))
      end
    end
  end
end
