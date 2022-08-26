require 'rails_helper'

RSpec.describe 'user discover page' do
  before :each do
    @user = User.create!(name: 'tom', email: 'tom@tom.com')

    visit "/users/#{@user.id}/discover"
  end


  it "has a button to see top rated movies", :vcr do
    expect(page).to have_button('Top Rated Movies')
    click_button 'Top Rated Movies'
    expect(current_path).to eq("/users/#{@user.id}/movies/index")
  end

  it 'has a movie search bar', :vcr do
    expect(page).to have_button('Search for movie')
    fill_in('name', with: 'mike')
    click_on 'Search for movies'
    expect(current_path).to eq("/users/#{@user.id}/movies/index")
  end


end
