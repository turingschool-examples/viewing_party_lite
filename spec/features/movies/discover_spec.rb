require 'rails_helper'

RSpec.describe "Discover Movies Dashboard", type: :feature do
  before :each do
    @user_1 = create(:user)
    visit user_discover_path(@user_1.id)
  end

  it 'has a button to discover top rated movies', :vcr do
    click_button('Find Top Rated Movies')  
    expect(current_path).to eq(user_movies_path(@user_1))
  end
  
  it 'has a button to search by movie title', :vcr do
    fill_in :search, with: 'The Evil Dead'
    click_button('Find Movies')  
    expect(current_path).to eq(user_movies_path(@user_1))
  end
end