require 'rails_helper'

RSpec.describe 'Movie Results Page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Bliffert Blankship", email: "Bliff@aol.com")
    @user2 = User.create!(name: "Blankert Bliffship", email: "Blank@aol.com")
    visit "/users/#{@user1.id}/discover"
  end

  it "displays Top Rated Movies" do 
    click_on("Find Top Rated Movies")
    expect(current_path).to eq("/users/#{@user1.id}/movies")
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content(8.7)
  end 

  it "has button to return to Discover Page" do 
    click_on("Find Top Rated Movies")
    click_on("Discover Page")
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end 

  it "displays movie search results" do 
    expect(page).to have_button("Find Movies")
    fill_in("movie", with: "Aliens")
    click_on("Find Movies")
    expect(current_path).to eq("/users/#{@user1.id}/movies")
  end 
end