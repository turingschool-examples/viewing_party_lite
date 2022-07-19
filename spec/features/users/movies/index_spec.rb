# frozen_string_literal: true
require 'rails_helper'

describe 'movie results/index page' do
  before do
    @user1 = User.create!(name: 'Jane', email: 'eleven@upsidedown.com', password: 
      'test123')
      visit '/login'
  
      fill_in :email, with: 'eleven@upsidedown.com'
      fill_in :password, with: 'test123'
 
      click_button 'Log In'
    visit "/discover"
  end
  it 'links to each movie results details/show page', :vcr do
    click_button "Find Top Rated Movies"
    click_link "The Shawshank Redemption"
    expect(current_path).to eq("/movies/278")
  end

  it 'links to the discover movies page', :vcr do
    click_button('Find Top Rated Movies')

    expect(current_path).to eq("/movies")

    click_button('Discover Page')

    expect(current_path).to eq("/discover")
  end
end
