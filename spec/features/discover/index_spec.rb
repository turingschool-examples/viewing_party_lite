require "rails_helper"

RSpec.describe "User's Discover Page", type: :feature do
  describe "" do
    before(:each) do
      @user = User.create!(name: "Sean Morris", email: "seanmorris@gmail.com")
      visit user_discover_index_path(@user)
    end

    xit "has a button to find top rated movies" do
      click_button "Find Top Rated Movies"
      expect(current_path).to eq("/users/#{@user.id}/movies?q=top%20rated")
    end

    xit "has a text field to enter keyword(s) to search by movie title and a search button" do
      fill_in "Search by movie title", with: "Pulp"
      click_button "Find Movies"
      expect(current_path).to eq("/users/#{@user.id}/movies?q=Pulp")
    end
  end
end
