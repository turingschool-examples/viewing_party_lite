require 'rails_helper'

RSpec.describe 'the movie discover page' do 
  before(:each) do 
    @user = create(:user)

    visit "users/#{@user.id}/discover"
  end

  it 'has a button to discover top rated movies' do 
    click_button 'Discover Top Rated Movies'
    expect(current_path).to eq(user_movies_path(@user))
  end

  it 'has a search field to search by a movie title' do 
    expect(page).to have_field('Search')
    click_button 'Search by Movie Title'
    expect(current_path).to eq(user_movies_path(@user))
  end
end