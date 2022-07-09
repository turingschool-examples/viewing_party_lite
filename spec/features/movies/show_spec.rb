require 'rails_helper'

RSpec.describe "Movie Deatils/Show Page" do
  describe "relocation buttons" do
    before :each do
      @user = User.create!(name: 'Drewb', email: 'Drew@testemail.com')
    end

    it "has a button to the new viewing party page", :vcr do
      visit "/users/#{@user.id}/movies/278"

      expect(page).to have_button("Create Viewing Party")
      click_button("Create Viewing Party")

      expect(current_path).to eq("/users/#{@user.id}/movies/278/viewing-party/new")
    end

    it "has a button to return to the discover page", :vcr do
      visit "/users/#{@user.id}/movies/278"

      expect(page).to have_button("Return to Discover")
      click_button("Return to Discover")

      expect(current_path).to eq("/users/#{@user.id}/discover")
    end
  end

  describe "movie details" do
    before :each do
      @user = User.create!(name: 'Drewb', email: 'Drew@testemail.com')
    end

    it "displays a movies details", :vcr do
      visit "/users/#{@user.id}/movies/278"

      expect(page).to have_content("The Shawshank Redemption's Details Page")
      expect(page).to have_content("Title: The Shawshank Redemption")
      expect(page).to have_content("Vote Average: 8.7")
      expect(page).to have_content("Runtime: 2:22")
      expect(page).to have_content("Genre(s): Drama, Crime")
      expect(page).to have_content("Summary: Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
      expect(page).to have_content("Cast:")
      expect(page).to have_content("Number of Reviews: 7")
      expect(page).to have_content("Reviews:")
    end
  end
end
