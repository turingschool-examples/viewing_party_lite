require 'rails_helper'

RSpec.describe 'discover movies page' do
  before(:each) do
    @user1 = User.create!(name: 'John Doe', email: 'johndoe@ymail.com')  
  end

  it 'has a button discover top rated movies that leads to top 20 rated movies' do
    visit user_discover_index_path(@user1)

    expect(page).to have_link('Find Top Rated Movies', href: "/users/#{@user1.id}/movies?q=top%20rated")

    click_link 'Find Top Rated Movies'
    expect(current_path).to eq(user_movies_path(@user1))
  end
  
  it 'has a search field to find movies by title' do
    visit user_discover_index_path(@user1)

    fill_in('q', with: 'The Matrix')
    click_on('Find Movies')

    expect(current_path).to eq(user_movies_path(@user1))
  end
end

# Button to Discover Top Rated Movies
# A text field to enter keyword(s) to search by movie title
# A Button to Search by Movie Title
# Details When the user clicks on the Top Rated Movies OR the search button, they should be taken to the movies results page (more details of this on the Movies Results Page issue.

# The movies will be retrieved by consuming The MovieDB API