require 'rails_helper'

RSpec.describe "Movies details page (/users/:id/movies/:id)", type: :feature do
  before :each do
    load_test_data
    visit user_discoveries_path(@user1.id)
    click_button "Find Top Rated Movies"
    click_link "The Godfather"
  end

  describe "visiting movies detail page" do
    it "there is a button to create a viewing party" do

     expect(page).to have_button("Create Viewing Party for The Godfather")
    end

    it "there is a button to return to the discover page" do
      click_button "Return to Discover Movies"

      expect(current_path).to eq(user_discoveries_path(@user1.id))

    end

    it "page displays movie title, vote avg of the movie, run time in hours and minutes, genres, summary discription"

    it "displays the first ten cast members (characters and actors)"

    it "count of total reviews, shows author of review and information"
  end
end