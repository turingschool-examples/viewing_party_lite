require 'rails_helper'

RSpec.describe "Discover Movies Results Page", type: :feature do
  before :each do
    @user_1 = create(:user)
    visit user_discover_path(@user_1.id)
  end

  it 'shows links to top rated movies title and vote average', :vcr do
    click_button('Find Top Rated Movies')  
    expect(current_path).to eq(user_movies_path(@user_1))
    expect(page).to have_link('The Godfather')
    expect(page).to have_content("Vote Average: 8.715")
    expect(current_path).to eq(user_movie_path(@user_1, 238))
  end
  
  it 'shows links to movies title and vote average searched for by keyword', :vcr do
    fill_in :search, with: 'The Evil Dead'
    click_button('Find Movies')  
    expect(current_path).to eq(user_movies_path(@user_1))
    expect(page).to have_link('The Evil Dead')
    expect(page).to have_content("Vote Average: 7.315")
    click_link('The Evil Dead')
    expect(current_path).to eq(user_movie_path(@user_1, 764))
  end
end