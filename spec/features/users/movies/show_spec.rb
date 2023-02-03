require 'rails_helper'

RSpec.describe "Movie Detail (Show) page" do
  before :each do
    @user = create(:user)

    visit user_movie_path(@user, id: '238')
  end

  describe "buttons to other pages" do
    it "button to discover page" do
      expect(page).to have_button("Discover Page")
      
      click_button("Discover Page")
      
      expect(current_path).to eq user_discover_index_path(@user)
    end

    it "button to create a viewing party" do
      expect(page).to have_button("Create Viewing Party for The Godfather")
      
      click_button("Create Viewing Party for The Godfather")

      expect(current_path).to eq("/users/#{@user.id}/movies/238/viewing_parties/new")
      # expect(current_path).to eq(new_user_movie_viewing_party_path)
    end
  end

  describe "displays movie information" do
    it "movie information" do
      within "#movie-title" do
        expect(page).to have_content("The Godfather")
      end

      within "#movie-details" do
        expect(page).to have_content("Vote: 8.7")
        expect(page).to have_content("Runtime: 2hr 55min")
        expect(page).to have_content("Genre: Drama, Crime")
        expect(page).to have_content("Spanning the years 1945 to 1955,")
        expect(page).to have_content("Marlon Brando as Don Vito Corleone")
        expect(page).to have_content("2 Reviews:")
        expect(page).to have_content("The Godfather Review by Al Carlson")
        expect(page).to have_content("futuretv")
      end
    end
  end
end