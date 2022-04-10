require 'rails_helper'

RSpec.describe 'Discover things:', type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Bliffert Blankship", email: "Bliff@aol.com", password: "12345", password_confirmation: "12345")
    @user2 = User.create!(name: "Blankert Bliffship", email: "Blank@aol.com", password: "12345", password: "12345" )
    @the_dark_knight = Party.create!(duration: 66, date: "01/12/13", start: "14:00", movie_id: 155)
    @user_party = UserParty.create!(user_id: @user1.id, party_id: @the_dark_knight.id)

    visit '/login'
    fill_in("name", with: @user1.name)
    fill_in("email", with: @user1.email)
    fill_in("Password", with: @user1.password)
    click_button("Log in")
    #binding.pry
    #
  end
  it "has stuff on the page" do
    click_on("Discover Movies")
    #binding.pry
    expect(current_path).to eq("/users/dashboard/discover")
    expect(page).to have_content("Discover movies and things about yourself Bliffert Blankship!")
  end

  it "has button to discover Top Rated Movies", :vcr do
    #save_and_open_page
    click_on("Discover Movies")
    click_on("Find Top Rated Movies")
    #binding.pry
    expect(current_path).to eq("/users/dashboard/movies")
  end

  it "has a text field and button to search for movies", :vcr do
    VCR.use_cassette("vcr sucks/things", :record => :new_episodes) do
      click_on("Discover Movies")
      #save_and_open_page
      expect(page).to have_button("Find Movies")
      fill_in("movie", with: "Aliens")
      click_on("Find Movies")
      expect(current_path).to eq("/users/dashboard/movies")
    end
  end
end
