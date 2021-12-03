require "rails_helper"

RSpec.describe "User's Discover Page", type: :feature do
  describe "" do
    before(:each) do
      @user = User.create!(name: "Sean Morris", email: "seanmorris@gmail.com")
      visit user_discover_index_path(@user)
    end

    it "has a button to find top rated movies" do
      VCR.use_cassette("top_rated_movies") do
        click_button "Find Top Rated Movies"

        expect(page.status_code).to eq 200
        expect(current_path).to eq(user_movies_path(@user))
        expect(page).to have_link(count: 41)
        expect(page).to have_content("Godfather")
        expect(page).to have_content("Parasite")
        expect(page).to have_content("Title: Schindler's List Vote Average:")

        # click_link "Spirited Away"
        # expect(current_path).to eq("/")
      end
    end

    it "has a text field to enter a keyword to search by movie title and a search button" do
      VCR.use_cassette("keyword_search_result_pulp") do
        fill_in :q, with: "Pulp"
        click_button "Find Movies"
        expect(current_path).to eq(user_movies_path(@user))
        expect(page).to have_content("Title: Pulp Fiction Vote Average: 8.5")
        #need more current version to do these tests
        # click_link "Pulp Fiction"
        # expect(current_path).to eq(user_movie_path(@user, 680))
      end
    end

    it "has a text field to enter multiple keywords to search by movie title and a search button" do
      VCR.use_cassette("keyword_search_result_christmas_story") do
        fill_in :q, with: "christmas story"
        click_button "Find Movies"

        expect(current_path).to eq(user_movies_path(@user))
        expect(page).to have_content("Title: A Christmas Story Vote Average: 7.3")
      end
    end
  end
end
