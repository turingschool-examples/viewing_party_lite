require 'rails_helper'

RSpec.describe "Movies details page (/users/:id/movies/:id)", type: :feature do
  before :each do
    load_test_data
    visit user_discoveries_path(@user1.id)
    click_button "Find Top Rated Movies"
    click_link "The Godfather"
    click_button "Create Viewing Party for The Godfather"
  end

  describe "visiting the new viewing party for a movie" do
    it "has create a viewing party with title" do
      expect(page).to have_content("Create a Viewing Party for The Godfather")
    end

    it "new form has field for duration in minutes and is greater than or equal to duraiton of the movie" do
      expect(page).to have_field(:duration, with: 175)
    end

    it "has field for selecting a date"

    it "has field to select a start time"

    it "has users listed as checkboxes"

    it "user fills out form and when create a party button is clicked they are redirected to the users's dashboard with the new event now displayed"
  end
end