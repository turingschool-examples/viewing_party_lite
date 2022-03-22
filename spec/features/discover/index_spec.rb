require 'rails_helper'

RSpec.describe 'Discover things:', type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Bliffert Blankship", email: "Bliff@aol.com")
    @user2 = User.create!(name: "Blankert Bliffship", email: "Blank@aol.com")

    visit "/users/#{@user1.id}/discover"
  end

  it "has stuff on the page" do
    expect(page).to have_content("Discover movies and things about yourself #{@user1.name}!")
  end

  it "has button to discover Top Rated Movies" do 
    click_on("Find Top Rated Movies")
    expect(current_path).to eq("/users/#{@user1.id}/movies")
  end 

end
