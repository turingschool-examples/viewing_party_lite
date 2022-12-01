require 'rails_helper'

RSpec.describe 'Discover Movies Page' do
  before(:each) do
    @user1 = User.create!(name: 'Chad', email: 'chad1@gmail.com')
    @user2 = User.create!(name: 'Jessica', email: 'jessica2@gmail.com')
    @user3 = User.create!(name: 'Fiona', email: 'Fiona3@gmail.com')
  end
  # As an user,
  # When I visit the '/users/:id/discover' path,
  # where :id, is the id of a valid user,
  # I should see
  it 'should have a button to discover top rated movies' do
    visit user_discover_path(@user1.id)

    within '#discover-top-rated-movies' do
      expect(page).to have_button('Discover Top Rated Movies')
    end
  end

  it 'should have a text field to enter keyword(s) to search by movie title' do
    # [ ] A text field to enter keyword(s) to search by movie title
  end

  it 'should have a button to search by movie title' do
    visit user_discover_path(@user1.id)

    within '#search-by-movie-title' do
      expect(page).to have_button('Search by Movie Title')
    end
  end
  # [ ] Details When the user clicks on the Top Rated Movies OR the search button, they should be taken to the movies results page (more
  # details of this on the Movies Results Page issue.
end
