require 'rails_helper'

RSpec.describe 'Movie Results Page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: "Bliffert Blankship", email: "Bliff@aol.com", password: "12345", password_confirmation: "12345")
    @user2 = User.create!(name: "Blankert Bliffship", email: "Blank@aol.com", password: "12345", password: "12345" )
    visit '/login'
    fill_in("name", with: @user1.name)
    fill_in("email", with: @user1.email)
    fill_in("Password", with: @user1.password)
    click_button("Log in")
    click_on("Discover Movies")
  end

  it "displays Top Rated Movies" do
    VCR.use_cassette('top_movies_results', re_record_interval: 7.days) do
      click_on("Find Top Rated Movies")
      expect(current_path).to eq("/users/dashboard/movies")
      expect(page.status_code).to eq 200
      expect(page).to have_link("The Shawshank Redemption")
      expect(page).to have_content(8.7)
    end
  end

  it "has button to return to Discover Page", :vcr do
    click_on("Find Top Rated Movies")
    click_on("Discover Page")
    expect(current_path).to eq("/users/dashboard/discover")
  end

  it "displays movie search results" do
    VCR.use_cassette('movie_search_results', re_record_interval: 7.days) do
      expect(page).to have_button("Find Movies")
      fill_in("movie", with: "Aliens")
      click_on("Find Movies")
      expect(current_path).to eq("/users/dashboard/movies")
      expect(page).to have_link("Aliens")
    end
  end
end
