require 'rails_helper'

RSpec.describe "Movies results page (/users/:id/movies)", type: :feature do
  before :each do
    load_test_data
  end

  describe "visiting results page from via the 'Find Top Rated Movies' button on discoveries page" do
    it "shows the top rated 20 movies" do
      visit user_discoveries_path(@user1.id)

      click_button "Find Top Rated Movies"
      expect(current_path).to eq("/users/#{@user1.id}/movies")

      within "#movies" do
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
      end
    end
  end
end