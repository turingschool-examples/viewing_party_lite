require 'rails_helper'

RSpec.describe "Movies details page (/users/:id/movies/:id)", type: :feature do
  before :each do
    load_test_data
    movie_id = 238
    top_rated_movies_stub
    movie_by_id_stub(movie_id)
    movie_cast_stub(movie_id)
    movie_reviews_stub(movie_id)
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

    it "page displays movie title, vote avg of the movie, run time in hours and minutes, genres, summary discription" do
      expect(page).to have_content("The Godfather")
      expect(page).to have_content("Vote Average: 8.7")
      expect(page).to have_content("Runtime: 2hr 55min")
      expect(page).to have_content("Genre: Drama, Crime")
      expect(page).to have_content("Summary: Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.")
    end

    it "displays the first ten cast members (characters and actors)" do
      within"#cast" do
        expect("Marlon Brando").to appear_before("Al Pacino")
        expect("Al Pacino").to appear_before("Richard S. Castellano")
        expect("Richard S. Castellano").to appear_before("Diane Keaton")
        expect("Diane Keaton").to appear_before("Sterling Hayden")
      end
    end

    it "count of total reviews, shows author of review and information" do
      within"#reviews" do
      expect(page).to have_content("Author: futuretv")
      expect(page).to have_content("The Sollozzo’s, a family of drug dealers, confront Don and request protection in exchange for profits from the Sollozzo’s drug sales.")
      expect(page).to have_content("2 Reviews")
    end
    end
  end
end
