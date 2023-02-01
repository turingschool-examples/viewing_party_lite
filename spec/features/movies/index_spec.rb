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
        
      end
    end
  end
end