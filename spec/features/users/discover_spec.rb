require 'rails_helper'

RSpec.describe "User Discover Dashboard" do
  before :each do
    test_user = create(:user)
    visit("users/#{test_user.id}/discover")
  end

  it 'has Button to Discover Top Rated Movies' do
    expect(page).to have_button('Top Rated Movies')
  end

  it 'has A text field to enter keyword(s) to search by movie title' do
    within('#movie-search') do
      expect(find('form')).to have_content('Movie Search')
    end
  end

  it 'has A Button to Search by Movie Title' do
    expect(find('form')).to have_button('Search')
  end

  context 'When the user clicks on this, they should be taken to the movies results page' do
    it 'Top Rated Movies' do
      click_button 'Top Rated Movies'
      expect(current_path).to eq(user_movies_index(test_user))
    end
      
    it 'the search button' do
      click_button 'Search'
      expect(current_path).to eq(user_movies_index(test_user))
    end
  end 
end