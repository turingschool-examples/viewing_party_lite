require 'rails_helper'

RSpec.describe "Movies results page (/users/:id/movies)", type: :feature do
  before :each do
    load_test_data
  end

  describe "visiting results page from via the 'Find Top Rated Movies' button on discoveries page" do
    it "shows the top rated 20 movies" do
      top_rated_movies_stub
      visit user_discoveries_path(@user1.id)

      click_button "Find Top Rated Movies"
      expect(current_path).to eq("/users/#{@user1.id}/movies")

      within "#movies_top_rated" do
        expect("The Godfather").to appear_before("The Shawshank Redemption")
        expect("The Shawshank Redemption").to appear_before("The Godfather Part II")
        expect("The Godfather Part II").to appear_before("Puss in Boots: The Last Wish")
        expect("Your Name").to appear_before("Parasite")
        expect("Parasite").to appear_before("Pulp Fiction")
        # expect("The Dark Night").to_not appear_before("Parasite")
        # expect("Gabriel's Inferno").to_not appear_before("Dou kyu sei - Classmates")

        expect(find(:table, "Movies")).to have_table_row("Title" => "The Godfather")
        expect(find(:table, "Movies")).to have_table_row("Vote Avg" => "8.7")
        expect(find(:table, "Movies")).to have_table_row("Title" => "The Lord of the Rings: The Return of the King")
        expect(find(:table, "Movies")).to have_table_row("Vote Avg" => "8.5")
        #this doesn't actually test that both items are on the same row, must come back and refactor
      end
    end
  end

  describe "visiting results page via the search by movie title feature" do
    it "shows the top 20 results from movie search" do
      keyword = "Encanto"
      movie_search_stub(keyword)
      visit user_discoveries_path(@user1.id)

      fill_in :q, with: keyword
      click_button "Find Movies"

      expect(current_path).to eq("/users/#{@user1.id}/movies")

      within "#movie_search_results" do
        expect(page).to have_content("Encanto")
      end
    end
  end

  describe "visiting either version of the results page" do
    it "has a button to go back to the discover page and goes there when clicked" do
      keyword = "Encanto"
      movie_search_stub(keyword)
      top_rated_movies_stub

      visit user_discoveries_path(@user1.id)

      fill_in :q, with: keyword
      click_button "Find Movies"

      expect(current_path).to eq("/users/#{@user1.id}/movies")

      click_button "Return to Discover Movies"

      expect(current_path).to eq(user_discoveries_path(@user1.id))

      click_button "Find Top Rated Movies"
      expect(current_path).to eq("/users/#{@user1.id}/movies")

      click_button "Return to Discover Movies"
      expect(current_path).to eq(user_discoveries_path(@user1.id))
    end
  end

  describe "when visiting a movies results page, each movie title is a link to a movie details page" do
    it 'clicking a moving takes user to the movies details page' do
      movie_id = 238
      top_rated_movies_stub
      movie_by_id_stub(movie_id)
      movie_cast_stub(movie_id)
      movie_reviews_stub(movie_id)

      visit user_discoveries_path(@user1.id)

      click_button "Find Top Rated Movies"

      expect(page).to have_link("The Godfather")

      click_link "The Godfather"

      expect(page).to have_content("The Godfather")
    end
  end
end