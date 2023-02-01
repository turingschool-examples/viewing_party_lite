require 'rails_helper'

RSpec.describe 'Movie results page' do
  before(:each) do
    @user1 = User.create!(name: 'John Doe', email: 'johndoe@ymail.com')
  end

  it 'lists top 20 rated movies when user clicks find top rated movies from dash' do
    visit user_discover_index_path(@user1)

    expect(page).to have_link('Find Top Rated Movies', href: "/users/#{@user1.id}/movies?q=top%20rated")

    click_link 'Find Top Rated Movies'
    
    expect(page).to have_content('The Godfather 8.7')
    expect(page).to have_content('The Shawshank Redemption 8.7')
    expect(page).to have_content('The Godfather Part II 8.6')
  end
  
  it 'populates relevant results given a keyword search from dashboard' do
    visit user_discover_index_path(@user1)
    
    fill_in('q', with: 'The Matrix')
    click_on('Find Movies')
    
    expect(current_path).to eq(user_movies_path(@user1))
    expect(page).to have_content('The Matrix Resurrections 6.6 The Matrix 8.2')
  end
end